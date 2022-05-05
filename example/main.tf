module "ecs_fargate" {
  source = "../."
  vpc_id                  = var.vpc_id
  environment             = var.environment
  name                    = var.name
  health_check_path       = var.health_check_path
  subnets                 = var.subnets
  alb_tls_cert_arn        = var.alb_tls_cert_arn 
  service_desired_count   = var.service_desired_count
  container_port          = 80
  region                  = var.region
  container_image         = var.container_image
  container_cpu           = var.container_cpu
  container_memory        = var.container_memory
}
