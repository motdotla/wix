require 'spec_helper'

describe Wix do
  subject { Wix }

  describe "defaults" do
    before do
      subject.app_secret_key  = nil
      subject.app_key         = nil
    end

    it { subject.app_secret_key.should eq "missing_app_secret_key" }
    it { subject.app_key.should eq "missing_app_key" }
  end

  describe "setting values" do
    let(:app_secret_key)   { "1234-5678" }
    let(:app_key)          { "5678-9012" }

    before do
      subject.app_secret_key    = app_secret_key
      subject.app_key           = app_key
    end

    it { subject.app_secret_key.should eq app_secret_key }
    it { subject.app_key.should eq app_key }
  end
end