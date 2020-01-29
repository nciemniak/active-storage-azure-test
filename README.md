# README

The test app is able to build without error, but when I try to employ [Active Storage](https://edgeguides.rubyonrails.org/active_storage_overview.html#downloading-files) functionality, it throws an error at the attached object's `download` method. To replicate, run the app and try to hit the `/transcriptions/index` endpoint.

You should expect to see the following error:
```
/Users/nciemniak/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/activestorage-6.0.1/lib/active_storage/service/configurator.rb:31:in `rescue in resolve': 
Cannot load `Rails.config.active_storage.service`: (RuntimeError)
Missing service adapter for "AzureStorage"
```


 It appears to be failing upon trying to find the [azure_storage_service.rb](https://github.com/rails/rails/blob/v5.2.2/activestorage/lib/active_storage/service/azure_storage_service.rb) file. When debugging, I am not able to step inside of the actual Active Storage classes where the error is getting thrown. It's strange to me that it's able to find the `configurator.rb` file, which is inside the same folder as the `azure_storage_service.rb` file. Perhaps there is a way to step inside the code where the error is being thrown? I'm not sure why I'm not able to do so using `binding.pry`, it just immediately throws an error when it tries to find the `download` method for the attached object attribute.
 
Error also gets thrown when I try to call the `open` method (same error) or the `purge` method (different error).

Currently, I have not included any azure credentials inside the `storage.yml` file, but I get the error whether I include credentials or not.
