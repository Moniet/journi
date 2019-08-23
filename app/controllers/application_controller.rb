class ApplicationController < ActionController::API
    before_action :authenticate

    def auth_header
        request.headers['Authorization']
    end

    def encode_token(payload)
        JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            JWT.decode(token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' })
        end
    end

    def current_user
        if decoded_token
            user = User.find(decoded_token[0]["user_id"])
        end
    end

    def logged_in?
        !!current_user
    end

    def authenticate
        if !logged_in?
            render json: {error: "unauthorized"}, status: 401 
        end
    end
end
