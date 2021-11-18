#include"dnae_pch.h"
#include<dna_engine.h>

class ExampleLayer : public dna_engine::Layer
{
public:
	ExampleLayer()
		: Layer("Example")
	{}

	void OnUpdate() override
	{
		if(dna_engine::Input::IsKeyPressed(DNAE_KEY_TAB))
			DNAE_TRACE("Tab Key is Pressed! (poll)");
	}

	void OnEvent(dna_engine::Event& event) override
	{
		if (event.GetEventType() == dna_engine::EventType::KeyPressed)
		{
			dna_engine::KeyPressedEvent& e = (dna_engine::KeyPressedEvent&)event;

			if(e.GetKeyCode() == DNAE_KEY_TAB)
				DNAE_TRACE("Tab Key is Pressed! (event)");

			DNAE_TRACE("{0}", (char)e.GetKeyCode());
		}
	}
};

class Sandbox : public dna_engine::Application
{
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
		PushOverlay(new dna_engine::ImGuiLayer());
	}

	~Sandbox()
	{

	}
};

dna_engine::Application* dna_engine::CreateApplication()
{
	return new Sandbox();
}