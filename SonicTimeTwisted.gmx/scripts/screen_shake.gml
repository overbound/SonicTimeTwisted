// Screen Shake
if instance_exists(objLevel) {
    if instance_exists(objLevel.player[0])  {
        with objLevel.player[0].camera {
        
            shake = true;
    
        }
    }
}
