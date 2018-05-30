variable credentials {
  description = "credentials"
  default     = "dotted-tide-203005-8ff54b1a307f.json"
}

variable project {
  description = "The project to deploy to, if not set the default provider project is used."
  default     = "dotted-tide-203005"
}

variable region {
  description = "Region for cloud resources"
  default     = "europe-west2"
}

variable topicname {
  description = ""
  default     = "default-topic"
}

variable subname {
  description = ""
  default     = "default-subscription"
}
