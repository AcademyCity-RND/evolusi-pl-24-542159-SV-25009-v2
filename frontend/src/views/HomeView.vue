<template>
  <div class="hero">
    <div class="hero-text">
      <h1 class="title">Elegansi dalam Setiap Jahitan</h1>
      <p class="subtitle">Percayakan penampilan terbaik Anda pada sentuhan profesional kami. Dari jas formal hingga kebaya modern, kami wujudkan pakaian impian Anda dengan presisi tinggi.</p>
      <router-link to="/portfolios" class="btn">Jelajahi Karya ➔</router-link>
    </div>
    <div class="hero-image">
      <div class="placeholder-img">
        <span class="img-text">Tailored to Perfection</span>
      </div>
    </div>
  </div>
</template>

<style scoped>
.hero { display: flex; align-items: center; gap: 40px; margin-top: 40px; }
.hero-text { flex: 1; }
.title { font-size: 3.5rem; line-height: 1.1; margin-bottom: 24px; color: white; font-weight: 700; letter-spacing: -0.02em; }
.subtitle { font-size: 1.125rem; color: var(--text-muted); margin-bottom: 32px; max-width: 90%; }
.hero-image { flex: 1; display: flex; justify-content: center; }
.placeholder-img { 
  width: 100%; height: 400px; 
  background: linear-gradient(135deg, #1e3a8a 0%, #0f172a 100%); 
  border-radius: 24px; display: flex; align-items: center; justify-content: center; 
  box-shadow: 0 25px 50px -12px rgba(0,0,0,0.5); 
  border: 1px solid var(--card-border);
}
.img-text { font-size: 1.5rem; font-weight: 700; color: #60a5fa; opacity: 0.8; letter-spacing: 0.1em; text-transform: uppercase; }
@media (max-width: 768px) { .hero { flex-direction: column; text-align: center; } .subtitle { max-width: 100%; } }
</style>
