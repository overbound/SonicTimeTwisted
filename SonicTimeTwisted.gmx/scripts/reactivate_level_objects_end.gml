instance_deactivate_object(objSceneObject);
instance_activate_object(objNonSolidAlwaysActive);
instance_activate_object(objSceneObjectAlwaysActive);
instance_activate_object(objEnemyAlwaysActive);
instance_activate_region(
     view_xview[view_current] - view_wview[view_current],
     view_yview[view_current] - view_hview[view_current],
     3 * view_wview[view_current],
     3 * view_hview[view_current],
     true
);
