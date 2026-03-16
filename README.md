# LLM-OS: Local LLM-Native Operating System

**LLM-OS** ist ein experimentelles, von Grund auf neu entwickeltes Betriebssystem, bei dem ein lokales Language Model (LLM) als zentraler Kernel fungiert. Anstelle klassischer Fenster-Systeme und Dateiordner nutzt LLM-OS ein **Language User Interface (LUI)** und einen **semantischen Vektorspeicher**.

---

## 🚀 Die Vision
Ein Betriebssystem, das den Nutzer versteht, proaktiv unterstützt und die Hardware vollumfänglich verwaltet – lokal, sicher und ohne Cloud-Zwang.

*   **LLM als Kernel:** Die Steuerung erfolgt über natürliche Sprache und intelligente Sensorik.
*   **Local-First Privacy:** Alle Analysen und Inferenz-Schritte finden auf dem Gerät (z. B. "Compute Puck") statt.
*   **Semantisches Datenmanagement:** Daten werden in hochdimensionalen Vektoren gespeichert („Bedeutung statt Dateiname“).
*   **Hardware-Native:** Optimiert für moderne NPUs (Neural Processing Units), speziell den Rockchip RK3588.

## 🏗️ Architektur
Das System ist für maximale Portabilität und Sicherheit ausgelegt:
*   **Sprache:** Geschrieben in **Rust** (`no_std`) für höchste Speichersicherheit und Performance.
*   **Multi-Architektur:** Ein minimaler Hardware Abstraction Layer (HAL) in Assembler unterstützt sowohl **ARM64** (Orange Pi 5 Plus) als auch **x86_64**.
*   **Microkernel-Design:** Treiber und Dienste laufen isoliert im Userspace, um Systemstabilität zu garantieren.
*   **Skill-Hub:** Ein offenes Ökosystem zum Austausch von Programmen und Fähigkeiten unter der MIT-Lizenz.

## 📍 Aktueller Status (Roadmap)
Wir befinden uns derzeit in **Phase 1: Bare-Metal Fundament**.
1.  [x] Projektstruktur und Rust-Konfiguration.
2.  [ ] Bootstrapping für ARM64 (Orange Pi 5 Plus).
3.  [ ] Memory Management & Priority-Round-Robin Scheduler.

Details findest du in der [Roadmap.md](./Roadmap.md).

## 🛠️ Hardware-Target: Orange Pi 5 Plus
Der Fokus der Erstentwicklung liegt auf dem **Orange Pi 5 Plus (RK3588)** aufgrund seiner leistungsstarken NPU (6 TOPS), die lokale KI-Inferenz in Echtzeit ermöglicht.

## 📄 Lizenz
Dieses Projekt steht unter der **MIT-Lizenz**. Siehe [LICENSE](./LICENSE) für weitere Informationen.

---
*Created with ❤️ for the future of human-computer interaction.*
