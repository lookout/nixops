{ config, lib, uuid, name, ... }:

with lib;

{

  options = {

    region = mkOption {
      example = "us-east-1";
      type = types.str;
      description = "Amazon EC2 region.";
    };

    accessKeyId = mkOption {
      type = types.str;
      default = "";
      description = "The AWS Access Key ID.";
    };

    name = mkOption {
      type = types.nullOr types.str;
      default = null;
      description = ''
        Name of the VPC.

        This creates a Name tag on the VPC with this as value if it exists.
      '';
      example = "myorg-prod";
    };

    cidr = mkOption {
      type = types.str;
      description = ''
        The CIDR of the VPC.

        Note: AWS applies limits to VPCs per region so you will want to plan
        accordingly:
        http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Appendix_Limits.html
      '';
      example = "10.64.0.0/16";
    };
  };

  config = {
    _type = "ec2-vpc";
  };

}
