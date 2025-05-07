#SecurityGroup For LT
module "quest_ec2_security_groups" {
  source = "../../modules/security_groups"

  vpc_id     = local.vpc_id
  project_name = local.project_name
  environment = local.environment 
  security_group_name = "${local.project_name}-${local.environment}-ec2-sg"
  description = "Security group for ${local.project_name} ${local.environment}"
  ingress_rules = [{
      description = "Allow traffic from ALB"
      from_port   = 3000
      to_port     = 3000
      protocol    = "tcp"
      security_groups = [module.quest_alb_security_groups.security_group_id]
      cidr_blocks = []
    }]
  egress_rules = [{
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }]  

    depends_on = [ module.quest_alb_security_groups ]
}

# Security Group for ALB
module "quest_alb_security_groups" {
  source = "../../modules/security_groups"

  vpc_id     = local.vpc_id
  project_name = local.project_name
  environment = local.environment 
  security_group_name = "${local.project_name}-${local.environment}-alb-sg"
  description = "Security group for ${local.project_name} ${local.environment}"
  ingress_rules = [{
      description = "Allow HTTPS traffic"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow HTTP traffic"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }]
  egress_rules = [{
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      cidr_blocks = local.vpc_cidr_block
    }]  
}

#Create Launch Template
module "quest-lt" {
  source = "../../modules/launchtmplate"
  
  project_name = local.project_name
  environment = local.environment
  ami_id = local.ami_id
  instance_type = local.instance_type
  security_group_ids = [module.quest_ec2_security_groups.security_group_id]
  user_data = templatefile("./userdata.sh", {
    docker_image_tag = local.docker_image_tag
  })
  key_name = local.key_name
  depends_on = [module.quest_ec2_security_groups]   
}

module "quest_asg" {
  source = "../../modules/asg"
  
  project_name = local.project_name
  environment = local.environment
  launch_template_id = module.quest-lt.launch_template_id
  launch_template_version = module.quest-lt.launch_template_latest_version
  vpc_subnet_ids = local.vpc_subnet_ids
  target_group_arns = [module.quest_tg.target_group_arn]

  depends_on = [module.quest-lt]
}

module "quest_tg" {
  source = "../../modules/tg"
  
  project_name = local.project_name
  environment = local.environment
  vpc_id = local.vpc_id
  target_group_settings = {
    port = 3000
    protocol = "HTTP"
    health_check_path = "/"
    health_check_port = 3000
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 5
    interval = 30
    matcher = "200-299"
  }

  depends_on = [module.quest-lt]
}

module "quest_alb" {
  source = "../../modules/alb"

  project_name = local.project_name
  environment = local.environment
  vpc_id = local.vpc_id
  subnet_ids = local.vpc_subnet_ids
  security_group_id = module.quest_alb_security_groups.security_group_id
  ssl_certificate_arn = local.ssl_certificate_arn
  tg_arn = module.quest_tg.target_group_arn

  depends_on = [module.quest_tg]
}
