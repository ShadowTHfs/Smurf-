<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smurf Guardian - Login</title>
    <link rel="icon" type="image/png" href="smurf-logo.png">
    <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --color-primary: #378ADD;
            --color-secondary: #1D9E75;
            --color-dark: #0f1621;
            --color-dark-alt: #1a2a3a;
            --color-gray-light: #B0B8D4;
            --color-white: #FFFFFF;
            --color-danger: #e74c3c;
            --color-success: #27ae60;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: linear-gradient(135deg, var(--color-dark) 0%, var(--color-dark-alt) 100%);
            color: var(--color-white);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem;
        }

        .login-container {
            width: 100%;
            max-width: 450px;
            background: var(--color-dark-alt);
            border: 2px solid var(--color-primary);
            border-radius: 16px;
            padding: 3rem 2.5rem;
            box-shadow: 0 10px 40px rgba(55, 138, 221, 0.2);
            animation: slideIn 0.5s ease-out;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .login-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }

        .login-logo {
            width: 100px;
            height: 100px;
            margin: 0 auto 1.5rem;
            display: block;
            filter: drop-shadow(0 0 12px rgba(55, 138, 221, 0.6));
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }

        .login-title {
            font-size: 28px;
            font-weight: 700;
            color: var(--color-primary);
            margin-bottom: 0.5rem;
        }

        .login-subtitle {
            font-size: 14px;
            color: var(--color-gray-light);
            margin-bottom: 0.5rem;
        }

        .login-description {
            font-size: 13px;
            color: var(--color-gray-light);
            opacity: 0.8;
        }

        .auth-tabs {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
            border-bottom: 2px solid rgba(55, 138, 221, 0.2);
        }

        .tab-btn {
            flex: 1;
            padding: 0.75rem;
            border: none;
            background: none;
            color: var(--color-gray-light);
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            border-bottom: 3px solid transparent;
            transition: all 0.3s ease;
            position: relative;
            bottom: -2px;
        }

        .tab-btn:hover {
            color: var(--color-primary);
        }

        .tab-btn.active {
            color: var(--color-primary);
            border-bottom-color: var(--color-primary);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: var(--color-gray-light);
            font-size: 14px;
            letter-spacing: 0.5px;
        }

        .form-input {
            width: 100%;
            padding: 0.875rem;
            background-color: var(--color-dark);
            border: 2px solid var(--color-primary);
            color: var(--color-white);
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s ease;
        }

        .form-input:focus {
            outline: none;
            box-shadow: 0 0 0 4px rgba(55, 138, 221, 0.2);
            border-color: var(--color-secondary);
        }

        .form-input::placeholder {
            color: var(--color-gray-light);
            opacity: 0.6;
        }

        .password-toggle {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: var(--color-primary);
            cursor: pointer;
            font-size: 18px;
            padding: 0;
        }

        .password-group {
            position: relative;
        }

        .form-help {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            font-size: 13px;
        }

        .form-help a {
            color: var(--color-primary);
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .form-help a:hover {
            color: var(--color-secondary);
            text-decoration: underline;
        }

        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .checkbox-input {
            width: 18px;
            height: 18px;
            cursor: pointer;
            accent-color: var(--color-primary);
        }

        .checkbox-label {
            cursor: pointer;
            color: var(--color-gray-light);
        }

        .btn-login {
            width: 100%;
            padding: 0.875rem;
            background: linear-gradient(135deg, var(--color-primary), var(--color-secondary));
            border: none;
            color: var(--color-white);
            border-radius: 8px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(55, 138, 221, 0.3);
        }

        .btn-login:active {
            transform: translateY(0);
        }

        .btn-login.loading {
            opacity: 0.8;
            pointer-events: none;
        }

        .spinner {
            width: 16px;
            height: 16px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-top-color: var(--color-white);
            border-radius: 50%;
            animation: spin 0.8s linear infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        .divider {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin: 2rem 0;
            font-size: 13px;
            color: var(--color-gray-light);
        }

        .divider-line {
            flex: 1;
            height: 1px;
            background: rgba(55, 138, 221, 0.2);
        }

        .oauth-buttons {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .oauth-btn {
            padding: 0.75rem;
            border: 2px solid var(--color-primary);
            background: transparent;
            color: var(--color-primary);
            border-radius: 8px;
            cursor: pointer;
            font-size: 13px;
            font-weight: 600;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .oauth-btn:hover {
            background: var(--color-primary);
            color: var(--color-white);
        }

        .auth-footer {
            text-align: center;
            margin-top: 2rem;
            font-size: 13px;
            color: var(--color-gray-light);
        }

        .auth-footer a {
            color: var(--color-primary);
            text-decoration: none;
            font-weight: 600;
            cursor: pointer;
        }

        .auth-footer a:hover {
            text-decoration: underline;
        }

        .alert {
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            border-left: 4px solid;
            font-size: 14px;
            animation: slideIn 0.3s ease-out;
        }

        .alert-danger {
            background-color: rgba(231, 76, 60, 0.15);
            border-color: var(--color-danger);
            color: var(--color-danger);
        }

        .alert-success {
            background-color: rgba(39, 174, 96, 0.15);
            border-color: var(--color-success);
            color: var(--color-success);
        }

        .alert-warning {
            background-color: rgba(243, 156, 18, 0.15);
            border-color: #f39c12;
            color: #f39c12;
        }

        .hidden {
            display: none !important;
        }

        /* RESPONSIVE */
        @media (max-width: 480px) {
            .login-container {
                padding: 2rem 1.5rem;
            }

            .login-title {
                font-size: 24px;
            }

            .oauth-buttons {
                grid-template-columns: 1fr;
            }
        }

        .success-icon {
            font-size: 48px;
            text-align: center;
            margin-bottom: 1rem;
            animation: bounce 0.6s ease-out;
        }

        @keyframes bounce {
            0% {
                opacity: 0;
                transform: scale(0.5);
            }
            50% {
                transform: scale(1.1);
            }
            100% {
                opacity: 1;
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <!-- LOGIN HEADER -->
        <div class="login-header">
            <img src="smurf-logo.png" alt="Smurf Guardian" class="login-logo">
            <div class="login-title">Smurf Guardian</div>
            <div class="login-subtitle">🛡️ Seu Defensor Digital</div>
            <div class="login-description">Gerenciador de Senhas Seguro e Intuitivo</div>
        </div>

        <!-- ALERTS -->
        <div id="alert-container"></div>

        <!-- AUTH TABS -->
        <div class="auth-tabs">
            <button class="tab-btn active" id="tab-signin" onclick="switchTab('signin')">
                🔓 Entrar
            </button>
            <button class="tab-btn" id="tab-signup" onclick="switchTab('signup')">
                ✨ Criar Conta
            </button>
            <button class="tab-btn" id="tab-reset" onclick="switchTab('reset')">
                🔑 Recuperar
            </button>
        </div>

        <!-- SIGN IN FORM -->
        <form id="signin-form" onsubmit="handleSignIn(event)">
            <div class="form-group">
                <label class="form-label">📧 Email</label>
                <input
                    type="email"
                    id="signin-email"
                    class="form-input"
                    placeholder="seu@email.com"
                    required
                >
            </div>

            <div class="form-group">
                <label class="form-label">🔐 Senha</label>
                <div class="password-group">
                    <input
                        type="password"
                        id="signin-password"
                        class="form-input"
                        placeholder="••••••••"
                        required
                    >
                    <button type="button" class="password-toggle" onclick="togglePassword('signin-password')">
                        👁️
                    </button>
                </div>
            </div>

            <div class="form-help">
                <div class="checkbox-group">
                    <input type="checkbox" id="remember-me" class="checkbox-input">
                    <label for="remember-me" class="checkbox-label">Lembrar-me</label>
                </div>
                <a href="#" onclick="switchTab('reset')">Esqueceu a senha?</a>
            </div>

            <button type="submit" class="btn-login" id="signin-btn">
                🚀 Entrar
            </button>
        </form>

        <!-- SIGN UP FORM -->
        <form id="signup-form" class="hidden" onsubmit="handleSignUp(event)">
            <div class="form-group">
                <label class="form-label">👤 Nome Completo</label>
                <input
                    type="text"
                    id="signup-name"
                    class="form-input"
                    placeholder="Seu nome"
                    required
                >
            </div>

            <div class="form-group">
                <label class="form-label">📧 Email</label>
                <input
                    type="email"
                    id="signup-email"
                    class="form-input"
                    placeholder="seu@email.com"
                    required
                >
            </div>

            <div class="form-group">
                <label class="form-label">🔐 Senha</label>
                <div class="password-group">
                    <input
                        type="password"
                        id="signup-password"
                        class="form-input"
                        placeholder="Mínimo 8 caracteres"
                        minlength="8"
                        required
                    >
                    <button type="button" class="password-toggle" onclick="togglePassword('signup-password')">
                        👁️
                    </button>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">✓ Confirmar Senha</label>
                <div class="password-group">
                    <input
                        type="password"
                        id="signup-confirm"
                        class="form-input"
                        placeholder="Confirme sua senha"
                        required
                    >
                    <button type="button" class="password-toggle" onclick="togglePassword('signup-confirm')">
                        👁️
                    </button>
                </div>
            </div>

            <div class="checkbox-group" style="margin-bottom: 1.5rem;">
                <input type="checkbox" id="terms" class="checkbox-input" required>
                <label for="terms" class="checkbox-label">
                    Aceito os <a href="#" style="color: var(--color-primary);">Termos de Serviço</a>
                </label>
            </div>

            <button type="submit" class="btn-login" id="signup-btn">
                ✨ Criar Conta
            </button>
        </form>

        <!-- RESET PASSWORD FORM -->
        <form id="reset-form" class="hidden" onsubmit="handleResetPassword(event)">
            <div class="alert alert-warning">
                ℹ️ Digite seu email para receber um link de recuperação de senha
            </div>

            <div class="form-group">
                <label class="form-label">📧 Email</label>
                <input
                    type="email"
                    id="reset-email"
                    class="form-input"
                    placeholder="seu@email.com"
                    required
                >
            </div>

            <button type="submit" class="btn-login" id="reset-btn">
                🔑 Enviar Link de Recuperação
            </button>
        </form>

        <!-- DIVIDER -->
        <div id="divider" class="divider">
            <div class="divider-line"></div>
            <span>ou</span>
            <div class="divider-line"></div>
        </div>

        <!-- OAUTH BUTTONS -->
        <div id="oauth-section" class="oauth-buttons">
            <button type="button" class="oauth-btn" onclick="signInWithOAuth('google')">
                🔵 Google
            </button>
            <button type="button" class="oauth-btn" onclick="signInWithOAuth('github')">
                ⚫ GitHub
            </button>
        </div>

        <!-- FOOTER -->
        <div class="auth-footer" id="signin-footer">
            Não tem conta?
            <a onclick="switchTab('signup')">Criar conta agora</a>
        </div>

        <div class="auth-footer hidden" id="signup-footer">
            Já tem conta?
            <a onclick="switchTab('signin')">Faça login aqui</a>
        </div>

        <div class="auth-footer hidden" id="reset-footer">
            Lembrou a senha?
            <a onclick="switchTab('signin')">Voltar para login</a>
        </div>
    </div>

    <script>
        // ============================================================
        // CONFIGURAÇÃO SUPABASE
        // ============================================================
        const SUPABASE_URL = 'https://arwxcpwvqnfwtkwolzls.supabase.co';
        const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFyd3hjcHd2cW5md3Rrd29semxzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODEyNjg1MzYsImV4cCI6MjA5Njg0NDUzNn0.fnkHU_4jXNMEycxAxNIyXIym6ZduOmxu1m_Sl2ioaIE';
        
        const { createClient } = supabase;
        const supabaseClient = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

        // ============================================================
        // FUNÇÕES DE UI
        // ============================================================
        function switchTab(tab) {
            // Esconder todos os forms
            document.getElementById('signin-form').classList.add('hidden');
            document.getElementById('signup-form').classList.add('hidden');
            document.getElementById('reset-form').classList.add('hidden');
            
            // Desativar todos os tabs
            document.getElementById('tab-signin').classList.remove('active');
            document.getElementById('tab-signup').classList.remove('active');
            document.getElementById('tab-reset').classList.remove('active');
            
            // Esconder todos os footers
            document.getElementById('signin-footer').classList.add('hidden');
            document.getElementById('signup-footer').classList.add('hidden');
            document.getElementById('reset-footer').classList.add('hidden');

            // OAuth e divider só aparecem na tela de login (signin)
            const divider = document.getElementById('divider');
            const oauthSection = document.getElementById('oauth-section');

            if (tab === 'signin') {
                document.getElementById('signin-form').classList.remove('hidden');
                document.getElementById('tab-signin').classList.add('active');
                document.getElementById('signin-footer').classList.remove('hidden');
                divider.classList.remove('hidden');
                oauthSection.classList.remove('hidden');
            } else if (tab === 'signup') {
                document.getElementById('signup-form').classList.remove('hidden');
                document.getElementById('tab-signup').classList.add('active');
                document.getElementById('signup-footer').classList.remove('hidden');
                divider.classList.add('hidden');
                oauthSection.classList.add('hidden');
            } else if (tab === 'reset') {
                document.getElementById('reset-form').classList.remove('hidden');
                document.getElementById('tab-reset').classList.add('active');
                document.getElementById('reset-footer').classList.remove('hidden');
                divider.classList.add('hidden');
                oauthSection.classList.add('hidden');
            }

            clearAlerts();
        }

        function togglePassword(inputId) {
            const input = document.getElementById(inputId);
            if (input.type === 'password') {
                input.type = 'text';
            } else {
                input.type = 'password';
            }
        }

        function showAlert(message, type = 'danger') {
            const alertContainer = document.getElementById('alert-container');
            const alert = document.createElement('div');
            alert.className = `alert alert-${type}`;
            alert.textContent = message;
            alertContainer.innerHTML = '';
            alertContainer.appendChild(alert);
        }

        function clearAlerts() {
            document.getElementById('alert-container').innerHTML = '';
        }

        function setButtonLoading(buttonId, isLoading) {
            const btn = document.getElementById(buttonId);
            if (isLoading) {
                btn.classList.add('loading');
                btn.innerHTML = '<div class="spinner"></div> Carregando...';
            } else {
                btn.classList.remove('loading');
                if (buttonId === 'signin-btn') {
                    btn.innerHTML = '🚀 Entrar';
                } else if (buttonId === 'signup-btn') {
                    btn.innerHTML = '✨ Criar Conta';
                } else if (buttonId === 'reset-btn') {
                    btn.innerHTML = '🔑 Enviar Link de Recuperação';
                }
            }
        }

        // ============================================================
        // AUTENTICAÇÃO
        // ============================================================
        async function handleSignIn(e) {
            e.preventDefault();
            clearAlerts();

            const email = document.getElementById('signin-email').value.trim();
            const password = document.getElementById('signin-password').value;

            if (!email || !password) {
                showAlert('❌ Preencha email e senha', 'danger');
                return;
            }

            setButtonLoading('signin-btn', true);

            try {
                const { data, error } = await supabaseClient.auth.signInWithPassword({
                    email: email,
                    password: password,
                });

                if (error) {
                    // Mensagens de erro mais claras
                    let msg = error.message;
                    if (msg.includes('Invalid login credentials')) {
                        msg = 'Email ou senha incorretos';
                    } else if (msg.includes('Email not confirmed')) {
                        msg = 'Email ainda não confirmado. Verifique sua caixa de entrada.';
                    }
                    showAlert(`❌ ${msg}`, 'danger');
                    setButtonLoading('signin-btn', false);
                } else if (data && data.session) {
                    // Sessão criada com sucesso - redirecionar
                    showAlert('✅ Login realizado! Redirecionando...', 'success');
                    window.location.replace('index-supabase.html');
                } else {
                    showAlert('❌ Não foi possível criar a sessão. Tente novamente.', 'danger');
                    setButtonLoading('signin-btn', false);
                }
            } catch (error) {
                showAlert(`❌ Erro: ${error.message}`, 'danger');
                setButtonLoading('signin-btn', false);
            }
        }

        async function handleSignUp(e) {
            e.preventDefault();
            clearAlerts();

            const name = document.getElementById('signup-name').value.trim();
            const email = document.getElementById('signup-email').value.trim();
            const password = document.getElementById('signup-password').value;
            const confirm = document.getElementById('signup-confirm').value;

            if (!name || !email || !password || !confirm) {
                showAlert('❌ Preencha todos os campos', 'danger');
                return;
            }

            if (password !== confirm) {
                showAlert('❌ As senhas não correspondem', 'danger');
                return;
            }

            if (password.length < 8) {
                showAlert('❌ Senha deve ter no mínimo 8 caracteres', 'danger');
                return;
            }

            setButtonLoading('signup-btn', true);

            try {
                const { data, error } = await supabaseClient.auth.signUp({
                    email: email,
                    password: password,
                    options: {
                        data: {
                            full_name: name,
                        },
                    },
                });

                if (error) {
                    showAlert(`❌ Erro: ${error.message}`, 'danger');
                } else {
                    showAlert(
                        '✅ Conta criada! Verifique seu email para confirmar.',
                        'success'
                    );
                    document.getElementById('signup-form').reset();
                    setTimeout(() => {
                        switchTab('signin');
                    }, 2000);
                }
            } catch (error) {
                showAlert(`❌ Erro: ${error.message}`, 'danger');
            } finally {
                setButtonLoading('signup-btn', false);
            }
        }

        async function handleResetPassword(e) {
            e.preventDefault();
            clearAlerts();

            const email = document.getElementById('reset-email').value.trim();

            if (!email) {
                showAlert('❌ Digite um email', 'danger');
                return;
            }

            setButtonLoading('reset-btn', true);

            try {
                const { data, error } = await supabaseClient.auth.resetPasswordForEmail(email, {
                    redirectTo: `${window.location.origin}/reset-password.html`,
                });

                if (error) {
                    showAlert(`❌ Erro: ${error.message}`, 'danger');
                } else {
                    showAlert(
                        '✅ Link de recuperação enviado para seu email!',
                        'success'
                    );
                    document.getElementById('reset-form').reset();
                    setTimeout(() => {
                        switchTab('signin');
                    }, 2000);
                }
            } catch (error) {
                showAlert(`❌ Erro: ${error.message}`, 'danger');
            } finally {
                setButtonLoading('reset-btn', false);
            }
        }

        async function signInWithOAuth(provider) {
            clearAlerts();

            try {
                const { data, error } = await supabaseClient.auth.signInWithOAuth({
                    provider: provider,
                    options: {
                        redirectTo: `${window.location.origin}/index-supabase.html`,
                    },
                });

                if (error) {
                    showAlert(`❌ Erro: ${error.message}`, 'danger');
                }
            } catch (error) {
                showAlert(`❌ Erro: ${error.message}`, 'danger');
            }
        }

        // ============================================================
        // VERIFICAR SE JÁ ESTÁ LOGADO
        // ============================================================
        async function checkAuthStatus() {
            // Se credenciais não configuradas, mostrar aviso e parar
            if (SUPABASE_URL.includes('seu-projeto') || SUPABASE_ANON_KEY.includes('sua-chave')) {
                showAlert('⚠️ Configure as credenciais do Supabase no código (SUPABASE_URL e SUPABASE_ANON_KEY)', 'warning');
                return;
            }

            try {
                const { data: { session } } = await supabaseClient.auth.getSession();

                if (session && session.user) {
                    // Usuário já está logado, redirecionar para o app
                    window.location.replace('index-supabase.html');
                }
            } catch (error) {
                console.error('Erro ao verificar autenticação:', error);
            }
        }

        // Verificar ao carregar a página
        window.addEventListener('load', checkAuthStatus);
    </script>
</body>
</html>
