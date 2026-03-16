# LLM-OS Roadmap (Target: ARM64 / Orange Pi 5 Plus)

Diese Roadmap beschreibt den schrittweisen Aufbau des LLM-Native Operating Systems, optimiert für den Rockchip RK3588 (Orange Pi 5 Plus).

## Phase 1: Bare-Metal Fundament (Hardware Abstraction Layer)
Fokus: Das Board zum Leben erwecken ohne ein bestehendes OS (Linux).

1.  **Bootstrapping (U-Boot Interface):**
    *   [ ] 1.1 Erstellen eines ARM64 Boot-Images.
    *   [ ] 1.2 Initialisierung der seriellen Konsole (UART) für Debug-Ausgaben.
    *   [ ] 1.3 Grundlegendes Exception-Handling (Sync/Async Abort) für ARMv8.
2.  **Memory Management Unit (MMU):**
    *   [ ] 2.1 Setup der Page-Tables (Identity Mapping).
    *   [ ] 2.2 Aktivierung von Caches (L1/L2) und MMU.
    *   [ ] 2.3 Implementierung eines einfachen Heap-Allocators (Kmalloc).
3.  **Interrupt-Controller (GICv3):**
    *   [ ] 3.1 Initialisierung des Generic Interrupt Controllers.
    *   [ ] 3.2 Timer-Interrupts für das System-Tick-Signal.

## Phase 2: Microkernel-Kern (Der Scheduler)
Fokus: Verwaltung von CPU-Zeit und Isolation.

4.  **Multitasking & Context-Switching:**
    *   [ ] 4.1 Definition des Thread-Kontrollblocks (TCB).
    *   [ ] 4.2 Manueller Context-Switch in Assembler (Save/Restore Register).
    *   [ ] 4.3 Implementierung des Priority-Round-Robin Schedulers.
5.  **IPC (Inter-Process Communication):**
    *   [ ] 5.1 Implementierung von Message-Passing zwischen isolierten Threads.
    *   [ ] 5.2 Einführung von Shared-Memory-Bereichen (für Video/Audio Streams).

## Phase 3: Hardware-Anbindung (Treiber-Layer)
Fokus: Zugriff auf die Peripherie des Orange Pi 5 Plus.

6.  **I/O & Speicher:**
    *   [ ] 6.1 NVMe-Treiber (PCIe Gen3) für schnellen SSD-Zugriff.
    *   [ ] 6.2 USB-Treiber (Basis) für Kamera-Input (Snapshots).
7.  **Konnektivität:**
    *   [ ] 7.1 WiFi/Ethernet-Treiber (RK3588-spezifisch).
    *   [ ] 7.2 Bluetooth-Stack für Peripherie-Koppelung (Smartring).

## Phase 4: NPU-Integration (Das "Herz" des OS)
Fokus: Nutzung der Rockchip NPU für lokale Inferenz.

8.  **NPU-Treiber:**
    *   [ ] 8.1 Integration des RKNN-Runtime-Kernels (Rockchip Neural Network).
    *   [ ] 8.2 Speichermapping für Gewichte und Tensoren im RAM.
9.  **Vektor-Mathematik-Provider:**
    *   [ ] 9.1 Implementierung der Hardware-beschleunigten Kosinus-Ähnlichkeit.
    *   [ ] 9.2 Anbindung des Vektor-Speichers an den NPU-Layer.

## Phase 5: LLM-Kernel & LUI
Fokus: Die Interaktionsschicht.

10. **Inferenz-Engine (Local-First):**
    *   [ ] 10.1 Laden eines quantisierten Modells (z.B. Llama-3-8B-RKNN).
    *   [ ] 10.2 Implementierung des "Semantic-Loop" (Input -> NPU -> OS-Action).
11. **Skill-System (The Hub):**
    *   [ ] 11.1 Definition der Skill-Manifest-Struktur.
    *   [ ] 11.2 Implementierung des Skill-Laders (Sandboxed Execution).

## Phase 6: Migration & Personalisierung
Fokus: Datensicherheit und Transfer.

12. **LoRA-Management:**
    *   [ ] 12.1 Speichern von inkrementellen Gewichtsänderungen (LoRAs).
    *   [ ] 12.2 Export/Import-Logik für Nutzer-Profile.
13. **Cloud/NAS Bridge:**
    *   [ ] 13.1 Implementierung verschlüsselter Netzwerk-Backups.
    *   [ ] 13.2 Transparentes File-Mapping für NAS-Daten.

## Phase 7: Self-Hosting & Native Tooling
Fokus: Entwicklung von Software auf dem Gerät selbst.

14. **Native Compiler-Toolchain:**
    *   [ ] 14.1 Portierung eines Backends (z. B. LLVM oder Zig) auf den LLM-Kernel.
    *   [ ] 14.2 Implementierung eines minimalen "On-Device" Linkers.
15. **LUI-IDE (Semantic Dev-Loop):**
    *   [ ] 15.1 Integration von Real-Time Code-Generierung im Kernel.
    *   [ ] 15.2 Implementierung von "Hot-Module-Reloading" für Kernel-Dienste.
    *   [ ] 15.3 Semantische Debugging-Schnittstelle (Sprach-Feedback bei Fehlern).
