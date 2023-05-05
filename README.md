# kub-poc-test

Description
RicardoV.KubPocTest.Api: Simple WebApi Sample
RicardoV.KubPocTest.Worker: Simple MassTransit Sample

## Create Helm Charts

```bash
mkdir charts
cd charts
helm create kub-poc-test-app

cd kub-poc-test-app
rm -r templates/* # Remove contents of top-level templates directory
cd charts

helm create kub-poc-test-app-api # Create a sub-chart for the API
helm create kub-poc-test-app-service # Create a sub-chart for the service

 # we don't need these files for sub-charts
rm kub-poc-test-app-api/.helmignore kub-poc-test-app-api/values.yaml
rm kub-poc-test-app-service/.helmignore kub-poc-test-app-service/values.yaml

# I'm not going to deal with these for now
rm kub-poc-test-app-api/templates/hpa.yaml kub-poc-test-app-api/templates/serviceaccount.yaml
rm kub-poc-test-app-service/templates/hpa.yaml kub-poc-test-app-service/templates/serviceaccount.yaml
rm -r kub-poc-test-app-api/templates/tests kub-poc-test-app-service/templates/tests

```