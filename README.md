# [Omura](https://en.wikipedia.org/wiki/Omura%27s_whale)

One Paragraph of project description goes here

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

1. [Docker](https://www.docker.com/products/docker-desktop) and Docker Compose

### Installing

Grab and build relevant Docker Images:
      
        docker-compose build

## Running the tests

Tests are run with [minitest](https://github.com/seattlerb/minitest).
The easiest way to run the entire suite with docker is:

        docker-compose run --rm web bundle exec ruby -Itest -e 'Dir["./test/**/{test_*,*_test}.rb"].each &method(:require)' --

### And coding style tests

Autoformatting is provided by the wonderful [rubyfmt](https://github.com/penelopezone/rubyfmt).
It's an exceptionally fast, opinionated, and well built tool for formatting `.rb` files.

## Built With

* [Roda](https://roda.jeremyevans.net/index.html) - The router for incoming requests.
* [Sorbet](https://sorbet.org/) - Static type checker.
* [Stripe](https://stripe.com/) - Product feed and payment processing.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/braidn/omura/tags). 

## Authors

* **Braden Douglass** - *Initial work* - [Braidn](https://github.com/braidn)

See also the list of [contributors](https://github.com/braidn/omura/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* [PurpleBooth](https://github.com/PurpleBooth) - For wonderful readme templates.
* [Beluga](https://github.com/binx/beluga) - For inspiring me to build smaller ecom tooling and naming.
* [Spree/Solidus](https://github.com/solidusio/solidus) - For making e-commerce in Ruby fun.
