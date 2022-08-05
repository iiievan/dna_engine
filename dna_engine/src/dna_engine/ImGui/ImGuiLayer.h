#pragma once

#include "dna_engine/Layer.h"
#include "dna_engine/Events/MouseEvent.h"
#include "dna_engine/Events/KeyEvent.h"
#include "dna_engine/Events/ApplicationEvent.h"

namespace dna_engine
{
	class DNAE_API ImGuiLayer : public Layer
	{
	public:
		ImGuiLayer();
		~ImGuiLayer();

		virtual void OnAttach() override;
		virtual void OnDetach() override;
		virtual void OnImGuiRender() override;

		void Begin();
		void End();

	private:
		float m_Time = 0.0f;

	};
}

