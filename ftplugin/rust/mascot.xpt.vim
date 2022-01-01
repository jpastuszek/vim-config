XPTemplate priority=personal

XPT mmodule " Mascot module template
use crate::prelude::*;

/// Sets up `description^
pub fn `name^(node_config: &mut Configuration, service: &Service) -> Result<ResourceId> {
    node_config.with_merged_name("`name^", |config| {
        Ok(())
    })
}
