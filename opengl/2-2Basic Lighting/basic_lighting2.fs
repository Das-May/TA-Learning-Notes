#version 330 core
out vec4 FragColor;

in vec3 FragCol;  

void main()
{
    FragColor = vec4(FragCol, 1.0);
} 