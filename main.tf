terraform {
  backend "consul" {
    address = "35.190.208.22:8500"
    path    = "remote-state-file"
	lock 	= "false"
  }
}

provider "google" {
  credentials = "${file("dotted-tide-203005-8ff54b1a307f.json")}"
  project     = "dotted-tide-203005"
  region      = "europe-west1-b"
}
resource "google_pubsub_topic" "default-topic" {
  name = "default-topic"
}
resource "google_pubsub_subscription" "default" {
  name  = "default-subscription"
  topic = "${google_pubsub_topic.default-topic.name}"

  ack_deadline_seconds = 20
}
