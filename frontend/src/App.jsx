import { HashRouter, Routes, Route } from 'react-router-dom'
import { AuthProvider } from './context/AuthContext'
import ProtectedRoute from './components/ProtectedRoute'

import Home               from './pages/Home'
import Login              from './pages/Login'
import Cadastro           from './pages/Cadastro'
import Dashboard          from './pages/Dashboard'
import Agendar            from './pages/Agendar'
import Perfil             from './pages/Perfil'
import EditarPerfil       from './pages/EditarPerfil'
import PoliticaPrivacidade from './pages/PoliticaPrivacidade'
import TermosUso          from './pages/TermosUso'

export default function App() {
  return (
    <AuthProvider>
      <HashRouter>
        <Routes>
          <Route path="/"                        element={<Home />} />
          <Route path="/login"                   element={<Login />} />
          <Route path="/cadastro"                element={<Cadastro />} />
          <Route path="/politica-de-privacidade" element={<PoliticaPrivacidade />} />
          <Route path="/termos-de-uso"           element={<TermosUso />} />

          <Route path="/dashboard" element={<ProtectedRoute><Dashboard /></ProtectedRoute>} />
          <Route path="/agendar"   element={<ProtectedRoute><Agendar /></ProtectedRoute>} />
          <Route path="/perfil"    element={<ProtectedRoute><Perfil /></ProtectedRoute>} />
          <Route path="/perfil/editar" element={<ProtectedRoute><EditarPerfil /></ProtectedRoute>} />
        </Routes>
      </HashRouter>
    </AuthProvider>
  )
}
