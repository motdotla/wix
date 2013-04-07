module Wix
  class Instance
    MISSING_WIX_SIGNED_INSTANCE = "You must pass a wix_signed_instance value to parse"
    INVALID_WIX_SIGNED_INSTANCE = "The wix_signed_instance you passed is invalid"
    INVALID_WIX_SIGNATURE       = "The signature from the wix_signed_instance you passed does not match your signature"

    def self.parse(wix_signed_instance)
      wix_signed_instance = wix_signed_instance.to_s.strip
      raise WixError.new(MISSING_WIX_SIGNED_INSTANCE) if wix_signed_instance.empty?

      split_wix_signed_instance = wix_signed_instance.split('.')
      raise WixError.new(INVALID_WIX_SIGNED_INSTANCE) if split_wix_signed_instance.length != 2

      signature     = split_wix_signed_instance[0]
      encoded_json  = split_wix_signed_instance[1]
      raise WixError.new(INVALID_WIX_SIGNATURE) if !valid_signature(signature, encoded_json)

      encoded_json_hack   = encoded_json + ('=' * (4 - encoded_json.length.modulo(4)))
      json_string         = Base64.urlsafe_decode64(encoded_json_hack)
      hash                = JSON.parse(json_string)

      RecursiveOpenStruct.new(hash, :recurse_over_arrays => true)
    rescue => error
      raise WixError.new(error.message)
    end

    def self.valid_signature(signature, encoded_json)
      hmac                    = OpenSSL::HMAC.digest(OpenSSL::Digest::SHA256.new, Wix.app_secret_key, encoded_json)
      my_signature            = Base64.urlsafe_encode64(hmac).gsub('=','')

      signature == my_signature
    end
  end
end