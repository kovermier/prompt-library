# 📋 Task-Specific Prompts

This directory contains specialized prompts organized by task type. Each category represents a different domain of AI assistance, from philosophical vibecoding archetypes to practical coding and content creation.

## 📊 Category Overview

| Category | Prompts | Description | Quick Start |
|----------|---------|-------------|-------------|
| **✨ [Vibecoding](./vibecoding/)** | 9 | Eight archetypal personas + quick reference guide | `./search -a "Pattern Synthesizer"` |
| **💻 [Coding](./coding/)** | 4 | Code generation, review, and development personas | `./search -c "tasks/coding"` |
| **✍️ [Writing](./writing/)** | 12 | Content creation, SEO, transcription, and professional writing | `./search -c "tasks/writing"` |
| **🔍 [Analysis](./analysis/)** | 7 | Data analysis, automation flows, and AI evaluation | `./search -c "tasks/analysis"` |
| **🎵 [Audio](./audio/)** | 5 | Music video storyboarding and audio property inference | `./search -c "tasks/audio"` |
| **🎨 [Design](./design/)** | 2 | UI/UX and visual design prompts | `./search -c "tasks/design"` |

**Total: 39 Task Prompts**

## 🌟 Featured: The Vibecoding System

Our flagship innovation - eight archetypal personas distilled from 29 philosophical paradigms:

- **🏛️ Clarity Architect** - Structural simplicity through fortress-like clarity
- **🪞 Direct Mirror** - Immediate insight without conceptual distortion  
- **🎼 Flow Director** - Dynamic harmony through structured improvisation
- **🔬 Truth Builder** - Foundational rigor through systematic validation
- **🕸️ Pattern Synthesizer** - Holistic integration revealing emergent understanding
- **🌱 Wisdom Guide** - Ethical integration honoring long-term harmony
- **🎨 Creative Organizer** - Aesthetic function making complexity beautiful
- **🔍 Purpose Seeker** - Authentic discovery through heart-centered inquiry

[**→ Explore the Vibecoding System**](./vibecoding/)

## 🚀 Quick Navigation

### By Task Type
```bash
# Find coding assistance
./search -c "tasks/coding" 

# Find writing prompts
./search -c "tasks/writing"

# Find analysis tools
./search -c "tasks/analysis"
```

### By Archetype
```bash
# Find prompts using specific archetypes
./search -a "Truth Builder"
./search -a "Flow Director"
```

### By Need
```bash
# Get task recommendations
./search -r "I need to review code"
./search -r "Help me write an article"
./search -r "Analyze this data"
```

## 📁 Directory Structure

```
tasks/
├── vibecoding/      # Philosophical archetypal system
│   ├── README.md
│   ├── quick-reference.md
│   └── [8 archetype files]
├── coding/          # Development & programming
│   ├── README.md
│   └── personas/    # Character & expert personas
├── writing/         # Content creation
│   └── README.md
├── analysis/        # Data & system analysis  
│   ├── README.md
│   └── audio/       # Audio-specific analysis
├── audio/           # Music & audio tasks
│   └── README.md
└── design/          # Visual & UI/UX design
    └── README.md
```

## 🔧 Usage Guidelines

1. **Choose Your Approach**:
   - **Vibecoding**: For philosophical depth and resonance-based selection
   - **Traditional**: For specific technical or creative tasks

2. **Search Before Creating**:
   ```bash
   # Always check existing prompts first
   ./search -r "your task description"
   ```

3. **Combine Systems**:
   - Use vibecoding archetypes to enhance traditional prompts
   - Blend multiple archetypes for complex needs
   - Apply archetypes to framework-based approaches

## 🏷️ Common Tags

**By Domain**: `coding`, `writing`, `analysis`, `design`, `audio`, `vibecoding`

**By Function**: `optimization`, `generation`, `review`, `transcription`, `documentation`

**By Approach**: `archetype`, `persona`, `framework`, `template`

## 💡 Pro Tips

- Start with the [Vibecoding Quick Reference](./vibecoding/quick-reference.md) for archetype selection
- Use category-specific READMEs for detailed guidance within each domain
- Combine search modes for precise results: `./search -c "tasks/writing" -t "seo"`
- When in doubt, use recommendation mode: `./search -r "describe your task"`

---

*For framework-based approaches, see [frameworks/](../frameworks/)*  
*For search tools and utilities, see [tools/](../tools/)*  
*For multi-step workflows, see [chains/](../chains/)*