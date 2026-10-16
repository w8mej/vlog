module Jekyll
  class TopicPageGenerator < Generator
    safe true

    # Define the core topics and their metadata
    TOPICS = {
      'Detection Engineering' => {
        'slug' => 'detection-engineering',
        'description' => 'Expert insights, strategies, and deep dives into Detection Engineering, Threat Hunting, and telemetry pipelines.',
        'content' => <<~CONTENT
          Detection Engineering is the art and science of identifying malicious activity within complex environments before it becomes a full-blown breach. It bridges the gap between threat intelligence and actionable alerts.

          ## Core Concepts

          - **Threat Modeling:** Understanding attacker methodologies and identifying critical assets.
          - **Telemetry Pipelines:** Managing the flow of logs, establishing baselines, and reducing noise.
          - **Rule Development:** Writing high-fidelity detection rules (e.g., Sigma, YARA, Splunk SPL) with low false-positive rates.
          - **Continuous Validation:** Testing detections against real-world attack simulations (e.g., Atomic Red Team).
        CONTENT
      },
      'Zero Trust Architecture' => {
        'slug' => 'zero-trust',
        'description' => 'Exploring Zero Trust principles, continuous verification, and identity-centric security models.',
        'content' => <<~CONTENT
          Zero Trust is a strategic approach to cybersecurity that eliminates implicit trust and continuously validates every stage of a digital interaction. 

          ## The Core Tenets of Zero Trust

          - **Never Trust, Always Verify:** No entity, inside or outside the network, is trusted by default.
          - **Identity-Centric Security:** Access is granted based on verified identity, device health, and context, not network location.
          - **Least Privilege Access:** Users and systems are granted only the minimum permissions necessary to perform their tasks.
          - **Micro-segmentation:** Dividing the network into smaller, isolated segments to contain potential breaches and limit lateral movement.

          ## Implementation Strategies

          Adopting Zero Trust is a journey, not a single product. It involves integrating identity and access management (IAM), endpoint security, network segmentation, and robust monitoring.
        CONTENT
      },
      'Zero Knowledge & Cryptography' => {
        'slug' => 'zero-knowledge',
        'description' => 'Deep research into Zero-Knowledge Proofs (ZKPs), Secure Multi-Party Computation (MPC), and trusted execution.',
        'content' => <<~CONTENT
          Zero-Knowledge Proofs (ZKPs) and advanced cryptographic methods are revolutionizing how we handle privacy, trust, and computation in untrusted environments.

          ## What is a Zero-Knowledge Proof?

          A Zero-Knowledge Proof allows one party to prove to another that a statement is true, without conveying any information apart from the fact that the statement is indeed true.

          ### Key Applications

          - **Privacy-Preserving Authentication:** Proving identity without revealing a password or sensitive personal data.
          - **Confidential Computing:** Processing encrypted data without decrypting it in memory.
          - **Blockchain Scaling (ZK-Rollups):** Verifying transactions off-chain and submitting a succinct proof to the main blockchain.

          ## Secure Multi-Party Computation (MPC)

          MPC enables multiple parties to jointly compute a function over their inputs while keeping those inputs private.
        CONTENT
      },
      'Cloud Security' => {
        'slug' => 'cloud-security',
        'description' => 'Advanced cloud security strategies covering AWS, GCP, OCI, Kubernetes, and DevSecOps best practices.',
        'content' => <<~CONTENT
          Securing the modern cloud requires a paradigm shift from traditional perimeter-based defense to agile, infrastructure-as-code (IaC) driven security models.

          ## Key Focus Areas

          - **Identity and Access Management (IAM):** Rigorous control over who (or what) can access cloud resources.
          - **Infrastructure as Code (IaC) Security:** Scanning Terraform, CloudFormation, and Kubernetes manifests for misconfigurations before deployment.
          - **Container & Kubernetes Security:** Securing the orchestrator, isolating workloads, and managing secrets effectively.
          - **Serverless Security:** Understanding the shared responsibility model and securing function code and triggers.

          ## Cloud-Native Threat Detection

          Building effective detection capabilities tailored to the ephemeral nature of cloud environments and understanding cloud-specific attack vectors.
        CONTENT
      }
    }

    def generate(site)
      TOPICS.each do |title, data|
        site.pages << TopicPage.new(site, site.source, data['slug'], title, data)
      end
    end
  end

  class TopicPage < Page
    def initialize(site, base, dir, title, data)
      @site = site
      @base = base
      @dir  = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'topic_pillar.html')
      
      self.data['title']       = title
      self.data['description'] = data['description']
      self.data['topic']       = title # Used to filter posts in the layout map
      
      # Convert the dynamic markdown directly into the Page content pipeline
      markdown_converter = site.find_converter_instance(Jekyll::Converters::Markdown)
      self.content = markdown_converter.convert(data['content'])
    end
  end
end
