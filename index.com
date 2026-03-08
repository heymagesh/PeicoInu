<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fractal Pengu | The Future of Solana Memes</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;800&display=swap" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        :root {
            --primary: #ff7a00;
            --primary-dark: #e66e00;
            --bg-light: #ffffff;
            --bg-soft: #fffaf5;
            --text-main: #1a1a1b;
            --text-sub: #555e67;
            --glass: rgba(255, 255, 255, 0.9);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background: radial-gradient(circle at top right, #fff5eb, #ffffff);
            color: var(--text-main);
            line-height: 1.6;
            overflow-x: hidden;
        }

        /* FIXED NAVBAR */
        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 5%;
            background: var(--glass);
            backdrop-filter: blur(12px);
            position: fixed;
            top: 0; width: 100%;
            z-index: 1000;
            border-bottom: 1px solid rgba(255,122,0,0.1);
        }

        .logo {
            font-weight: 800;
            font-size: 22px;
            color: var(--primary);
            letter-spacing: -1px;
            white-space: nowrap;
        }

        .nav-links {
            display: flex;
            align-items: center;
        }

        .nav-links a {
            margin-left: 20px;
            text-decoration: none;
            color: var(--text-main);
            font-weight: 600;
            transition: 0.3s;
            font-size: 14px;
        }

        .nav-links a:hover { color: var(--primary); }

        .cta-nav {
            background: var(--primary);
            color: white !important;
            padding: 8px 18px;
            border-radius: 50px;
            box-shadow: 0 4px 15px rgba(255,122,0,0.3);
            display: inline-block;
        }

        /* HERO SECTION */
        .hero {
            padding: 140px 20px 80px;
            text-align: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        .hero-img {
            width: 240px;
            border-radius: 50%;
            margin-bottom: 30px;
            animation: float 4s ease-in-out infinite;
            filter: drop-shadow(0 10px 30px rgba(255,122,0,0.3));
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-15px); }
        }

        .hero h1 {
            font-size: clamp(32px, 7vw, 64px);
            font-weight: 800;
            line-height: 1.1;
            margin-bottom: 20px;
        }

        .hero h1 span { color: var(--primary); }

        .hero p {
            font-size: 18px;
            color: var(--text-sub);
            max-width: 650px;
            margin: 0 auto 40px;
        }

        .btn-main {
            padding: 16px 40px;
            background: var(--primary);
            color: white;
            border: none;
            border-radius: 50px;
            font-size: 18px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.4s;
            box-shadow: 0 10px 25px rgba(255,122,0,0.3);
        }

        .btn-main:hover { transform: scale(1.05); }

        /* SECTIONS */
        section { padding: 80px 8%; text-align: center; }
        h2 { font-size: 36px; margin-bottom: 20px; font-weight: 800; }
        
        .section-desc { 
            max-width: 800px; margin: 0 auto 40px; 
            font-size: 17px; color: var(--text-sub); 
        }

        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
        }

        .glass-card {
            background: white;
            padding: 30px;
            border-radius: 20px;
            border: 1px solid rgba(255,122,0,0.08);
            box-shadow: 0 10px 30px rgba(0,0,0,0.02);
            text-align: left;
        }

        .glass-card h3 { color: var(--primary); margin-bottom: 12px; }

        /* TOKENOMICS */
        .token-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
        }
        .stat-item {
            background: var(--bg-soft);
            padding: 25px;
            border-radius: 15px;
        }
        .stat-item strong { font-size: 22px; color: var(--primary); display: block; }

        /* CHART CONTAINER FIX */
        .chart-wrapper {
            margin-top: 40px;
            width: 100%;
            max-width: 1100px;
            margin-left: auto;
            margin-right: auto;
            border-radius: 24px;
            overflow: hidden;
            border: 1px solid rgba(0,0,0,0.1);
            height: 600px;
        }

        /* CONTRACT BOX */
        .ca-container {
            background: #111;
            padding: 40px 20px;
            border-radius: 24px;
            color: white;
        }

        .ca-box {
            display: flex;
            background: rgba(255,255,255,0.08);
            padding: 12px;
            border-radius: 12px;
            max-width: 500px;
            margin: 20px auto 0;
            align-items: center;
        }

        .ca-box input {
            background: none; border: none; color: white; width: 100%; font-size: 14px; outline: none; padding: 0 10px;
        }

        .copy-btn {
            background: var(--primary);
            color: white; border: none; padding: 8px 15px; border-radius: 8px; cursor: pointer; white-space: nowrap;
        }

        footer { padding: 40px; background: #000; color: #666; font-size: 13px; }

        /* MOBILE FIX */
        @media (max-width: 768px) {
            nav { padding: 10px 5%; flex-direction: column; height: auto; }
            .nav-links { margin-top: 10px; flex-wrap: wrap; justify-content: center; }
            .nav-links a { margin: 5px 10px; font-size: 12px; }
            .hero { padding-top: 180px; }
            .chart-wrapper { height: 450px; }
        }
    </style>
</head>
<body>

<nav>
    <div class="logo">Fractal Pengu</div>
    <div class="nav-links">
        <a href="#about">About</a>
        <a href="#tokenomics">Tokenomics</a>
        <a href="#roadmap">Roadmap</a>
        <a href="https://t.me/fractal_pengu_official" target="_blank">Telegram</a>
        <a href="#chart" class="cta-nav">View Chart</a>
    </div>
</nav>

<main>
    <section class="hero">
        <img src="pengu1.png" class="hero-img" alt="Fractal Penguin">
        <h1 data-aos="fade-up">The <span>Fractal Penguin</span> Powering Solana's Next Wave</h1>
        <p data-aos="fade-up" data-aos-delay="100">
            A hyper-deflationary meme movement where geometry meets community. Built on Solana for lightning speed and fractal-sized gains.
        </p>
        <button class="btn-main" onclick="buy()">Buy $FPENGU Now</button>
    </section>

    <section id="about" data-aos="fade-up">
        <h2>About The Movement</h2>
        <div class="card-grid">
            <div class="glass-card">
                <h3>Infinite Scalability</h3>
                <p>Leveraging Solana's high-speed architecture to ensure your transactions are as fast as a penguin on ice.</p>
            </div>
            <div class="glass-card">
                <h3>Community First</h3>
                <p>No secret team tokens. No hidden agendas. 100% community-owned and driven by collective creativity.</p>
            </div>
            <div class="glass-card">
                <h3>Meme Utility</h3>
                <p>Developing a fractal-based NFT ecosystem where holders get exclusive access to future 'Pengu' drops.</p>
            </div>
        </div>
    </section>

    <section id="tokenomics" style="background: var(--bg-soft);">
        <h2 data-aos="fade-up">Tokenomics</h2>
        <div class="token-stats" data-aos="fade-up">
            <div class="stat-item"><span>Total Supply</span><strong>300M</strong></div>
            <div class="stat-item"><span>Ticker</span><strong>$FPENGU</strong></div>
            <div class="stat-item"><span>Tax</span><strong>0%</strong></div>
            <div class="stat-item"><span>Liquidity</span><strong>Burned</strong></div>
        </div>
    </section>

    <section id="chart">
        <h2 data-aos="fade-up">Market Tracker</h2>
        <div class="chart-wrapper">
            <iframe 
                width="100%" 
                height="100%" 
                src="https://dexscreener.com/solana/88KA3T1Tq2n85pha75jG1GuXRkqZCbBr9jxF8EutDa91?embed=1&theme=light&trades=0&info=0" 
                style="border:0;">
            </iframe>
        </div>
    </section>

    <section id="contract">
        <div class="ca-container" data-aos="zoom-in">
            <h2>Join the Colony</h2>
            <div class="ca-box">
                <input type="text" id="ca" value="88KA3T1Tq2n85pha75jG1GuXRkqZCbBr9jxF8EutDa91" readonly>
                <button class="copy-btn" onclick="copy()">Copy</button>
            </div>
        </div>
    </section>
</main>

<footer>
    <p>© 2026 Fractal Pengu Protocol. $FPENGU is a meme coin. Invest responsibly.</p>
</footer>

<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init({ duration: 1000, once: true });

    function copy() {
        const copyText = document.getElementById("ca");
        copyText.select();
        navigator.clipboard.writeText(copyText.value);
        const btn = document.querySelector('.copy-btn');
        btn.innerText = "Copied!";
        setTimeout(() => { btn.innerText = "Copy"; }, 2000);
    }

    function buy() {
        window.open("https://raydium.io/swap/?inputCurrency=sol&outputCurrency=88KA3T1Tq2n85pha75jG1GuXRkqZCbBr9jxF8EutDa91", "_blank");
    }
</script>

</body>
</html>
