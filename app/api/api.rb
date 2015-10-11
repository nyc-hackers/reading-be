require 'listicle/email_links'

class API < Grape::API
    prefix "api"
    version "v1", using: :path
    format :json
    mount Email_Links::Links
end