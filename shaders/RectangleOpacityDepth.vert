#version 400

layout (location = 0) in vec3 inPos;
layout (location = 1) in vec3 inTangent;
layout (location = 2) in vec3 inMoveDirection;

uniform mat4 uNormalMatrix;
uniform mat4 uMV;
uniform mat4 uVP;
uniform mat4 uP;
uniform vec3 uLightPos;
uniform float uThickness;

out vec4 ioPos;

void main()
{
	vec4 position = uMV * vec4(inPos, 1.0);
	position = vec4(inMoveDirection * uThickness, 0.0) + position;

	position = uP * position;

	ioPos = position;
	gl_Position = position;
}