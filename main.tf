terraform {
  backend "consul" {
    address = "35.190.208.22:8500"
    path    = "remote-state-file"
	lock 	= "false"
  }
}

resource "google_pubsub_topic" "default-topic" {
  name = "${var.topicname}"
}
resource "google_pubsub_subscription" "default" {
  name  = "${var.subname}"
  topic = "${google_pubsub_topic.default-topic.name}"

  ack_deadline_seconds = 20
}
