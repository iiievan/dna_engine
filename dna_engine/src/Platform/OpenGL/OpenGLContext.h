#pragma once
#include "dna_engine/Renderer/GraphicsContext.h"

struct GLFWwindow;

namespace dna_engine
{
	class OpenGLContext : public GraphicsContext
	{
	public:
		OpenGLContext(GLFWwindow* windowHandle);

		virtual void Init() override;
		virtual void SwapBuffers() override;
	private:
		GLFWwindow* m_WindowHandle;
	};
}
