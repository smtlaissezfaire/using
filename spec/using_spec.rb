require File.dirname(__FILE__) + "/spec_helper"

describe Using do
  before(:each) do
    Using.reset_default_load_scheme!
    @obj = Object.new
    @obj.extend Using
  end

  after(:each) do
    Using.reset_default_load_scheme!
  end

  describe "load schemes" do
    it "should have the load scheme as :require by default" do
      @obj.load_scheme.should equal(:require)
    end

    it "should be able to set the load scheme to :autoload" do
      @obj.load_scheme = :autoload
      @obj.load_scheme.should equal(:autoload)
    end

    it "should be able to set the load scheme to :load" do
      @obj.load_scheme = :load
      @obj.load_scheme.should equal(:load)
    end

    it "should raise an error when setting the load scheme to something else" do
      lambda {
        @obj.load_scheme = :foo
      }.should raise_error
    end

    it "should be able to set the load_scheme as a class method" do
      Using.default_load_scheme = :autoload
      obj = Object.new
      obj.extend Using
      obj.load_scheme.should equal(:autoload)
    end
  end

  def dirname
    File.expand_path(File.dirname(__FILE__))
  end

  def file_prefix
    "#{dirname}/using_spec"
  end

  describe "with require" do
    before do
      @obj.stub!(:require)
      @obj.load_scheme = :require
    end

    it "should require the constant mapped from the file" do
      @obj.should_receive(:require).with("#{file_prefix}/foo")
      @obj.using :Foo
    end

    it "should use underscores for capitalizations" do
      @obj.should_receive(:require).with("#{file_prefix}/foo_bar")
      @obj.using :FooBar
    end
  end

  describe "with autoload" do
    before do
      @obj.stub!(:autoload)
      @obj.load_scheme = :autoload
    end

    it "should autoload the constant mapped from the file" do
      @obj.should_receive(:autoload).with(:Foo, "#{file_prefix}/foo")
      @obj.using :Foo
    end
  end

  describe "when using load" do
    before do
      @obj.stub!(:load)
      @obj.load_scheme = :load
    end

    it "should load the constant mapped from the file" do
      @obj.should_receive(:load).with("#{file_prefix}/foo.rb")
      @obj.using :Foo
    end
  end

  describe "using a load scheme with a block" do
    before do
      @obj.stub!(:load)
      @obj.stub!(:require)
      @obj.stub!(:autoload)
      
      @obj.load_scheme = :require
    end

    it "should use the load scheme given in the block" do
      @obj.should_receive(:load).with("#{file_prefix}/foo.rb")

      @obj.instance_eval do
        with_load_scheme(:load) do
          using :Foo
        end
      end
    end

    it "should use the correct load scheme" do
      @obj.with_load_scheme(:autoload) do
        @obj.should_receive(:autoload).with(:Foo, "#{file_prefix}/foo")
        @obj.using :Foo
      end
    end

    it "should swap back the old scheme when done" do
      lambda {
        @obj.with_load_scheme(:autoload) { }
      }.should_not change(@obj, :load_scheme)
    end

    it "should swap back to the old load scheme even if loading causes an error" do
      lambda {
        begin
          @obj.with_load_scheme(:autoload) {
            raise
          }
        rescue; end
      }.should_not change(@obj, :load_scheme)
    end
  end
end
