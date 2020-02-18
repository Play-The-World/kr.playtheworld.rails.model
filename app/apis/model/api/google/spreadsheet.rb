require "fileutils"

module Model::Api::Google
  class Spreadsheet
    OOB_URI = "urn:ietf:wg:oauth:2.0:oob".freeze
    APPLICATION_NAME = "PLAY THE WORLD".freeze
    CREDENTIALS_PATH = File.join(File.dirname(__FILE__), "credentials.json").freeze
    # The file token.yaml stores the user's access and refresh tokens, and is
    # created automatically when the authorization flow completes for the first
    # time.
    TOKEN_PATH = File.join(File.dirname(__FILE__), "token.yaml").freeze
    SCOPE = Google::Apis::SheetsV4::AUTH_SPREADSHEETS_READONLY
    attr_accessor :id
    attr_accessor :service

    def initialize(id)
      # Initialize the API
      @service = Google::Apis::SheetsV4::SheetsService.new
      @service.client_options.application_name = APPLICATION_NAME
      @service.authorization = authorize
      @id = id
    end

    def values(range)
      raise "Set sheet ID first." if @id.nil?
      spreadsheet_id = @id
      response = @service.get_spreadsheet_values(spreadsheet_id, range)
      puts "No data found." if response.values.empty?
      response.values
    end

    private
      ##
      # Ensure valid credentials, either by restoring from the saved credentials
      # files or intitiating an OAuth2 authorization. If authorization is required,
      # the user's default browser will be launched to approve the request.
      #
      # @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
      def authorize
        client_id = Google::Auth::ClientId.from_file(CREDENTIALS_PATH)
        token_store = Google::Auth::Stores::FileTokenStore.new(file: TOKEN_PATH)
        authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
        user_id = "default"
        credentials = authorizer.get_credentials(user_id)
        if credentials.nil?
          url = authorizer.get_authorization_url(base_url: OOB_URI)
          puts "Open the following URL in the browser and enter the " \
              "resulting code after authorization:\n" + url
          code = STDIN.gets
          credentials = authorizer.get_and_store_credentials_from_code(
            user_id: user_id, code: code, base_url: OOB_URI
          )
        end
        credentials
      end
  end
end