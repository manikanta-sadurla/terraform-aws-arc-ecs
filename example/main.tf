module "ecs_fargate" {
  source           = "../."
  vpc_id           = var.vpc_id
  environment      = var.environment
  name             = var.name
  subnets          = var.subnets
  region           = var.region
  alb_tls_cert_arn = var.alb_tls_cert_arn
  dns_name         = var.dns_name
  zone_id          = var.zone_id
}

module "ecs_service_fargate" {
  source                = "../health_check_service"
  environment           = var.environment
  target_group_arn      = module.ecs_fargate.ecs_target_group_arn
  name                  = var.name
  health_check_path     = var.health_check_path
  subnets               = ["subnet-0a8ad8675ba94a41a", "subnet-0684a88ac45bc33a1"]
  service_desired_count = var.service_desired_count
  container_port        = var.container_port
  region                = var.region
  container_image       = var.container_image
  container_cpu         = var.container_cpu
  container_memory      = var.container_memory
  vpc_id                = var.vpc_id


  depends_on = [
    module.ecs_fargate.ecs_target_group_arn, module.ecs_fargate.alb
  ]

  ecs_cluster_id = module.ecs_fargate.ecs_cluster_id
}
