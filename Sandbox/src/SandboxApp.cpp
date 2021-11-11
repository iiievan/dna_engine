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
		DNAE_INFO("ExampleLayer::Update");
	}

	void OnEvent(dna_engine::Event& event) override
	{
		DNAE_TRACE("{0}", event);
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