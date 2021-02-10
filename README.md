# chaos-carnival-demo

This repo can be used to setup a simple demo environment to execute chaos experiments with Litmus. 

## Prerequisites
- A Kubernetes cluster v1.11 or later
- Cluster admin access

## Infrastructure
Any Kubernetes cluster will do the job. The infrastructure used in this repo is a GKE cluster which you can deploy easily using the terraform files in the infra directory. Note that you'll have to change the projectID to match your GCP project.

## Deploying the Hipster shop
You can deploy the hipster shop using [this repo](https://github.com/GoogleCloudPlatform/microservices-demo) from Google. It will automatically deploy all the components and expose the frontend service. It also includes a load generator in case you want to use it. A quick command to deploy it in an already created namespace (for example `hipster-shop`) is:

`kubectl -n hipster-shop apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/microservices-demo/master/release/kubernetes-manifests.yaml`

## Deploying Litmus and executing the experiment

Feel free to read the [litmus docs](https://docs.litmuschaos.io/docs/getstarted/) for more details around configuring experiments and installing Litmus in a cluster.

The experiment CRDs and manifests are executing an experiment between the `frontend` and `CheckoutService`. The default configuration adds 2s delay for 60s. You'll need to apply the rbac.yaml to give the proper permissions to the experiment, then the experiment CRD and finaly the chaosengine CR that will initiate the experiment. The manifests assume a dedicated namespace called `hipster-shop`. Keep in mind that they are namespaced resources, so if you change the namespace name, you'll need to modify the manifests.

## Next steps
Feel free now to explore Litmus and create your own experiments. You can also explore Argo workflows to automate the experiments. Feel free to reach out for more questions around chaos! 

## License
Distributed under the MIT License. See `LICENSE` for more information.