require 'httparty'
require 'json'

module FileIOUploader
  def self.upload_image(file_path)
    # Ensure the file exists
    raise "File not found" unless File.exist?(file_path)

    response = HTTParty.post("https://file.io",
                             body: { file: File.new(file_path) },
                             headers: { 'Content-Type' => 'multipart/form-data' })
    
    # Parse the response
    begin
      result = JSON.parse(response.body)
      if result["success"]
        return result["link"]
      else
        raise "Upload failed: #{result['message']}"
      end
    rescue JSON::ParserError
      raise "Invalid response received from the server."
    end
  end
end
