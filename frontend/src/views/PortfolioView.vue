<template>
  <div class="portfolio-page">
    <div class="header">
      <h1 class="page-title">Karya Kami</h1>
      <p class="page-subtitle">Jelajahi koleksi mahakarya jahitan terbaru dari studio kami.</p>
    </div>

    <div v-if="loading" class="state-container">
      <div class="spinner"></div>
      <p class="state-text">Mengambil data dari server...</p>
    </div>

    <div v-else-if="error" class="state-container error-box">
      <div class="error-icon">⚠️</div>
      <h3 class="error-title">Koneksi Terputus</h3>
      <p class="state-text">{{ error }}</p>
      <button @click="fetchData" class="btn retry-btn">Coba Lagi</button>
    </div>

    <div v-else class="grid">
      <div v-for="item in portfolios" :key="item.id" class="card">
        <div class="card-image">👕</div>
        <div class="card-content">
          <span class="badge">{{ item.category }}</span>
          <h3 class="card-title">{{ item.title }}</h3>
          <p class="card-desc">{{ item.description }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'

const portfolios = ref([])
const loading = ref(true)
const error = ref(null)

const fetchData = async () => {
  loading.value = true
  error.value = null
  try {
    const response = await fetch(`${import.meta.env.VITE_API_URL}/portfolios`)
    if (!response.ok) throw new Error(`HTTP Error: ${response.status}`)
    const data = await response.json()
    portfolios.value = data.data || data
  } catch (err) {
    error.value = "Server Laravel sedang tidak dapat dijangkau. (" + err.message + ")"
  } finally {
    loading.value = false
  }
}

onMounted(fetchData)
</script>

<style scoped>
.header { text-align: center; margin-bottom: 60px; }
.page-title { font-size: 2.5rem; color: white; font-weight: 700; margin-bottom: 12px; }
.page-subtitle { color: var(--text-muted); font-size: 1.125rem; }

.state-container { 
  text-align: center; padding: 80px 20px; border-radius: 24px; 
  background: var(--card-bg); border: 1px solid var(--card-border);
}
.state-text { color: var(--text-muted); margin-bottom: 20px; }
.spinner { 
  width: 48px; height: 48px; 
  border: 4px solid #334155; border-top-color: #3b82f6; 
  border-radius: 50%; animation: spin 1s linear infinite; margin: 0 auto 24px; 
}
@keyframes spin { to { transform: rotate(360deg); } }

.error-box { background: rgba(127, 29, 29, 0.2); border-color: rgba(153, 27, 27, 0.4); }
.error-title { color: #fca5a5; font-size: 1.5rem; margin-bottom: 10px; }
.error-icon { font-size: 3.5rem; margin-bottom: 20px; opacity: 0.9; }

.grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(320px, 1fr)); gap: 32px; }
.card { 
  background: var(--card-bg); border-radius: 20px; overflow: hidden; 
  border: 1px solid var(--card-border); transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1); 
}
.card:hover { transform: translateY(-8px); border-color: #475569; box-shadow: 0 20px 25px -5px rgba(0,0,0,0.3); }
.card-image { 
  height: 180px; background: #0f172a; 
  display: flex; align-items: center; justify-content: center; font-size: 4rem; 
  border-bottom: 1px solid var(--card-border);
}
.card-content { padding: 32px; }
.badge { 
  display: inline-block; padding: 4px 12px; background: rgba(30, 58, 138, 0.5); 
  color: #93c5fd; font-size: 0.75rem; font-weight: 600; border-radius: 9999px; 
  margin-bottom: 16px; text-transform: uppercase; letter-spacing: 0.05em; 
  border: 1px solid rgba(29, 78, 216, 0.4);
}
.card-title { font-size: 1.35rem; margin-bottom: 12px; color: white; font-weight: 600; }
.card-desc { color: var(--text-muted); font-size: 0.95rem; line-height: 1.6; }
</style>
