module Wix
  class Instance
    def self.parse(wix_signed_instance)
      signature, encoded_json = wix_signed_instance.split('.', 2)
      
      raise "Invalid signature" if !valid_signature(signature, encoded_json)

      encoded_json_hack   = encoded_json + ('=' * (4 - encoded_json.length.modulo(4)))
      json_string         = Base64.urlsafe_decode64(encoded_json_hack)
      hash                = JSON.parse(json_string)

      RecursiveOpenStruct.new(hash, :recurse_over_arrays => true)
    end

    def self.valid_signature(signature, encoded_json)
      hmac                    = OpenSSL::HMAC.digest(OpenSSL::Digest::SHA256.new, Wix.app_secret_key, encoded_json)
      my_signature            = Base64.urlsafe_encode64(hmac).gsub('=','')

      signature == my_signature
    end
  end
end