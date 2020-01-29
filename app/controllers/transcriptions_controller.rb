class TranscriptionsController < ApplicationController
  def index
    @transcription = Transcription.new

    full_path_to_file = File.expand_path("~/transcription_files_temp/temp.txt")
    file = File.open(full_path_to_file,  'w')
    file.write("test")
    file.close()

    @transcription.file.attach(io: File.open(full_path_to_file), filename: 'temp.txt')

    # error happens here:
    @transcription.file.download

    send_file full_path_to_file
  end
end
