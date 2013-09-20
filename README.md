# StringClusterer

String clustering algorithms, taken from the ones available in [OpenRefine](https://github.com/OpenRefine/OpenRefine).

*[2013-09-20] Only **binning with fingerprint keyer** exists.*

For more in-depth info about these clustering methods, check the [OpenRefine wiki](https://github.com/OpenRefine/OpenRefine/wiki/Clustering-In-Depth).

## Installation

Add this line to your application's Gemfile:

    gem 'string_clusterer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install string_clusterer

## Usage

```ruby
require 'string_clusterer'

keyer = StringClusterer::Binning::FingerprintKeyer.new
clusters = %w{Román Ramon Ramón Sáenz Saénz}.group_by { |n| keyer.key(n) }
# => {"roman" => ["Román"], "ramon"=>["Ramon", "Ramón"], "saenz"=>["Sáenz", "Saénz"]}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
