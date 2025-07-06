# 📦 SCP Guide: Copying Files from Mac to Raspberry Pi

> Quick cheat‑sheet for local (home Wi‑Fi) and remote (DuckDNS) transfers.

---

## 1. Local Network (SSH)

```bash
scp -P 2222 -r [LOCAL_PATH] biel@192.168.1.170:[RPI_DEST]
```

**Example**

```bash
scp -P 2222 -r ~/Desktop/products biel@192.168.1.170:~/Desktop/
```

---

## 2. Remote via DuckDNS (SSHREMOTA)

```bash
scp -P 2222 -r [LOCAL_PATH] biel@raspberrybiel.duckdns.org:[RPI_DEST]
```

**Example**

```bash
scp -P 2222 -r ~/Desktop/products biel@raspberrybiel.duckdns.org:~/Desktop/
```

---

## 3. Parameter Reference

| Flag / Field   | Meaning                                                               |
| -------------- | --------------------------------------------------------------------- |
| `-P 2222`      | Use custom SSH port (change if you forwarded a different one).        |
| `-r`           | Recursive copy; required for directories.                             |
| `[LOCAL_PATH]` | Path on your Mac (e.g. `~/RoAssets/productos`).                       |
| `[RPI_DEST]`   | Destination path on Raspberry Pi (e.g. `~/RoAssets/`).               |
