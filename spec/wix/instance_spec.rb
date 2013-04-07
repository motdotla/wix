require 'spec_helper'

describe Wix::Instance do
  let(:instance) { Wix::Instance.parse(wix_signed_instance) }

  context "nil for wix_signed_instance" do
    let(:wix_signed_instance)        { nil }

    it { lambda { instance }.should raise_error(StandardError, Wix::Instance::MISSING_WIX_SIGNED_INSTANCE) }
  end

  context "empty string for wix_signed_instance" do
    let(:wix_signed_instance)        { "" }

    it { lambda { instance }.should raise_error(StandardError, Wix::Instance::MISSING_WIX_SIGNED_INSTANCE) }
  end

  context "empty string with spaces for wix_signed_instance" do
    let(:wix_signed_instance)        { " " }

    it { lambda { instance }.should raise_error(StandardError, Wix::Instance::MISSING_WIX_SIGNED_INSTANCE) }
  end

  context "string without a . delimiter" do
    let(:wix_signed_instance)        { "string-no-dot-delimiter" }

    it { lambda { instance }.should raise_error(StandardError, Wix::Instance::INVALID_WIX_SIGNED_INSTANCE) }
  end
end