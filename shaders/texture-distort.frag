void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 p = fragCoord.xy / iResolution.xy;
    vec3 sepia = vec3(112/255,66/255,20/255);
    vec2 origin = vec2(.5,.5);
    float intensity = 0.0;
    float rot
      = radians(iGlobalTime * length(p-origin));
    
    p-=.5;
    
    mat2 m = mat2(cos(rot), -sin(rot),
                  sin(rot), cos(rot));
    p  = m * p;

    p+=.5;
	
    fragColor = vec4(mix(texture2D( iChannel0, p ).xyz, sepia, intensity),1);
}