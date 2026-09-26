<template>
  <div class="app-wrapper">
    <header class="navbar">
      <div class="container nav-content">
        <router-link to="/" class="brand-group">
          <div class="brand-logo">UN</div>
          <div class="brand-text">
            <span class="brand-title">Unknown</span>
            <span class="brand-subtitle">Jahit & Busana Kustom</span>
          </div>
        </router-link>
        <nav class="nav-links">
          <router-link to="/" class="nav-link">Beranda</router-link>
          <router-link to="/portfolios" class="nav-link">Katalog Karya</router-link>
        </nav>
      </div>
    </header>
    <main class="container main-content">
      <router-view v-slot="{ Component }">
        <transition name="fade" mode="out-in">
          <component :is="Component" />
        </transition>
      </router-view>
    </main>
  </div>
</template>

<style scoped>
.app-wrapper { min-height: 100vh; display: flex; flex-direction: column; }
.navbar { 
  background: var(--nav-bg); backdrop-filter: blur(12px);
  border-bottom: 1px solid var(--nav-border);
  box-shadow: 0 10px 15px -3px rgba(23, 37, 84, 0.2);
  position: sticky; top: 0; z-index: 100; 
}
.nav-content { display: flex; justify-content: space-between; align-items: center; height: 80px; }

.brand-group { display: flex; align-items: center; gap: 12px; text-decoration: none; cursor: pointer; }
.brand-logo {
  width: 44px; height: 44px; border-radius: 50%;
  background: #1e3a8a; border: 1px solid rgba(29, 78, 216, 0.8);
  display: flex; align-items: center; justify-content: center;
  color: white; font-weight: 700; font-size: 1.125rem;
  box-shadow: inset 0 2px 4px 0 rgba(0, 0, 0, 0.06);
  transition: background-color 0.2s;
}
.brand-group:hover .brand-logo { background: #1e40af; }
.brand-text { display: flex; flex-direction: column; }
.brand-title { font-size: 1.25rem; font-weight: 700; color: white; letter-spacing: 0.05em; transition: color 0.2s; }
.brand-group:hover .brand-title { color: #93c5fd; }
.brand-subtitle { font-size: 0.625rem; text-transform: uppercase; letter-spacing: 0.25em; color: #60a5fa; }

.nav-links { display: flex; gap: 4px; }
.nav-link { 
  padding: 8px 16px; border-radius: 8px; font-size: 0.875rem; font-weight: 500;
  text-decoration: none; color: var(--primary-light);
  transition: all 0.2s; border: 1px solid transparent;
}
.nav-link:hover { color: white; background: rgba(30, 58, 138, 0.4); }
.nav-link.router-link-active { 
  background: rgba(30, 64, 175, 0.8); color: white;
  border-color: rgba(29, 78, 216, 0.5);
  box-shadow: 0 1px 2px 0 rgba(30, 58, 138, 0.4);
}
.main-content { flex: 1; padding: 40px 20px; width: 100%; }
</style>
