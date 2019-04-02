# Usage:
#   pact-provider-verifier PACT_URL ... -h, --provider-base-url=PROVIDER_BASE_URL

# Options:
#   -h, --provider-base-url=PROVIDER_BASE_URL                          # Provider host URL
#   -c, [--provider-states-setup-url=PROVIDER_STATES_SETUP_URL]        # Base URL to setup the provider states at
#       [--pact-broker-base-url=PACT_BROKER_BASE_URL]                  # Base URL of the Pact Broker from which to retrieve the pacts.
#   -n, [--broker-username=BROKER_USERNAME]                            # Pact Broker basic auth username
#   -p, [--broker-password=BROKER_PASSWORD]                            # Pact Broker basic auth password
#       [--provider=PROVIDER]
#       [--consumer-version-tag=TAG]                                   # Retrieve the latest pacts with this consumer version tag. Used in conjunction with --provider. May be specified multiple times.
#   -a, [--provider-app-version=PROVIDER_APP_VERSION]                  # Provider application version, required when publishing verification results
#   -r, [--publish-verification-results=PUBLISH_VERIFICATION_RESULTS]  # Publish verification results to the broker
#       [--custom-provider-header=CUSTOM_PROVIDER_HEADER]              # Header to add to provider state set up and pact verification requests. eg 'Authorization: Basic cGFjdDpwYWN0'. May be specified multiple times.
#       [--custom-middleware=FILE]                                     # Ruby file containing a class implementing Pact::ProviderVerifier::CustomMiddleware. This allows the response to be modified before replaying. Use with caution!
#   -v, [--verbose=VERBOSE]                                            # Verbose output
#   -f, [--format=FORMATTER]                                           # RSpec formatter. Defaults to custom Pact formatter. Other options are json and RspecJunitFormatter (which outputs xml).
#   -o, [--out=FILE]                                                   # Write output to a file instead of $stdout.
  
pact-provider-verifier $PACT_BROKER_URL --provider-base-url $PACT_PROVIDER_URL --broker-user $PACT_BROKER_BASIC_AUTH_USERNAME --broker-password=$PACT_BROKER_BASIC_AUTH_PASSWORD