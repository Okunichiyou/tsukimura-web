struct ProfilePage {
    static func render(age: String) -> HTML {
        HTML(html: """
        <!DOCTYPE html>
        <html lang="ja">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>月村手毬 — プロフィール</title>
            <style>
                * { box-sizing: border-box; margin: 0; padding: 0; }

                body {
                    font-family: 'Helvetica Neue', Arial, 'Hiragino Kaku Gothic ProN', Meiryo, sans-serif;
                    background: #f4f7fa;
                    color: #333;
                    min-height: 100vh;
                }

                /* ヘッダー */
                header {
                    background: #0c7bbb;
                    color: #fff;
                    padding: 18px 32px;
                    display: flex;
                    align-items: center;
                    gap: 14px;
                    box-shadow: 0 2px 8px rgba(12,123,187,0.3);
                }
                header .label {
                    font-size: 11px;
                    letter-spacing: 0.12em;
                    text-transform: uppercase;
                    opacity: 0.8;
                }
                header h1 {
                    font-size: 20px;
                    font-weight: 700;
                    letter-spacing: 0.04em;
                }
                header .divider {
                    width: 1px;
                    height: 32px;
                    background: rgba(255,255,255,0.4);
                }

                /* メインレイアウト */
                main {
                    max-width: 820px;
                    margin: 48px auto;
                    padding: 0 24px;
                    display: grid;
                    grid-template-columns: 260px 1fr;
                    gap: 28px;
                }

                /* 左カラム：写真 + キャッチコピー */
                .photo-card {
                    background: #fff;
                    border-radius: 16px;
                    overflow: hidden;
                    box-shadow: 0 2px 16px rgba(0,0,0,0.08);
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                }
                .photo-card .accent-bar {
                    width: 100%;
                    height: 8px;
                    background: #0c7bbb;
                }
                .photo-card img {
                    width: 200px;
                    height: 200px;
                    object-fit: cover;
                    border-radius: 50%;
                    margin: 28px auto 16px;
                    border: 4px solid #0c7bbb;
                    display: block;
                }
                .photo-card .name-ja {
                    font-size: 22px;
                    font-weight: 800;
                    color: #0c7bbb;
                    letter-spacing: 0.06em;
                }
                .photo-card .name-ruby {
                    font-size: 12px;
                    color: #888;
                    letter-spacing: 0.1em;
                    margin-top: 4px;
                }
                .photo-card .catch {
                    font-size: 12px;
                    color: #555;
                    font-style: italic;
                    text-align: center;
                    padding: 16px 20px 24px;
                    line-height: 1.6;
                    border-top: 1px solid #f0f0f0;
                    margin-top: 16px;
                }

                /* 右カラム */
                .right-col {
                    display: flex;
                    flex-direction: column;
                    gap: 20px;
                }

                /* プロフィールカード */
                .card {
                    background: #fff;
                    border-radius: 16px;
                    box-shadow: 0 2px 16px rgba(0,0,0,0.08);
                    overflow: hidden;
                }
                .card-header {
                    background: #0c7bbb;
                    color: #fff;
                    font-size: 12px;
                    font-weight: 700;
                    letter-spacing: 0.14em;
                    text-transform: uppercase;
                    padding: 10px 20px;
                }
                .card-body {
                    padding: 18px 20px;
                }

                /* プロフィール行 */
                .profile-grid {
                    display: grid;
                    grid-template-columns: 1fr 1fr;
                    gap: 4px 12px;
                }
                .profile-row {
                    display: flex;
                    align-items: baseline;
                    gap: 8px;
                    padding: 9px 0;
                    border-bottom: 1px solid #f2f2f2;
                }
                .profile-grid .profile-row:last-child,
                .profile-grid .profile-row:nth-last-child(2):nth-child(odd) {
                    border-bottom: none;
                }
                .profile-key {
                    font-size: 11px;
                    color: #888;
                    letter-spacing: 0.06em;
                    white-space: nowrap;
                    min-width: 56px;
                }
                .profile-val {
                    font-size: 14px;
                    font-weight: 600;
                    color: #222;
                }
                .profile-val .unit {
                    font-size: 11px;
                    font-weight: 400;
                    color: #888;
                    margin-left: 2px;
                }
                .age-highlight {
                    font-size: 22px;
                    color: #0c7bbb;
                }

                /* バイオ */
                .bio {
                    font-size: 13px;
                    line-height: 1.85;
                    color: #555;
                }

                @media (max-width: 600px) {
                    main { grid-template-columns: 1fr; }
                    .profile-grid { grid-template-columns: 1fr; }
                }
            </style>
        </head>
        <body>

            <header>
                <div>
                    <div class="label">Hatsuhoshi Gakuen · Idol Department</div>
                    <h1>月村 手毬</h1>
                </div>
            </header>

            <main>
                <!-- 左：写真 -->
                <div class="photo-card">
                    <div class="accent-bar"></div>
                    <img src="/temari.jpeg" alt="月村手毬">
                    <div class="name-ja">月村 手毬</div>
                    <div class="name-ruby">つきむら てまり</div>
                    <div class="catch">「夢？いいえ、<br>必ず達成する目標です。」</div>
                </div>

                <!-- 右：プロフィール -->
                <div class="right-col">

                    <div class="card">
                        <div class="card-header">Basic Profile</div>
                        <div class="card-body">
                            <div class="profile-grid">
                                <div class="profile-row">
                                    <span class="profile-key">誕生日</span>
                                    <span class="profile-val">6月3日 <span class="unit">（ふたご座）</span></span>
                                </div>
                                <div class="profile-row">
                                    <span class="profile-key">現在の年齢</span>
                                    <span class="profile-val"><span class="age-highlight">\(age)</span><span class="unit"> 歳</span></span>
                                </div>
                                <div class="profile-row">
                                    <span class="profile-key">血液型</span>
                                    <span class="profile-val">AB 型</span>
                                </div>
                                <div class="profile-row">
                                    <span class="profile-key">出身地</span>
                                    <span class="profile-val">京都府</span>
                                </div>
                                <div class="profile-row">
                                    <span class="profile-key">身長</span>
                                    <span class="profile-val">162<span class="unit"> cm</span></span>
                                </div>
                                <div class="profile-row">
                                    <span class="profile-key">体重</span>
                                    <span class="profile-val">51<span class="unit"> kg</span></span>
                                </div>
                                <div class="profile-row">
                                    <span class="profile-key">利き手</span>
                                    <span class="profile-val">右</span>
                                </div>
                                <div class="profile-row">
                                    <span class="profile-key">声優</span>
                                    <span class="profile-val">小鹿 なお</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header">Skills &amp; Hobbies</div>
                        <div class="card-body">
                            <div class="profile-row" style="border-bottom:1px solid #f2f2f2;">
                                <span class="profile-key">特技</span>
                                <span class="profile-val">歌</span>
                            </div>
                            <div class="profile-row" style="border-bottom:none;">
                                <span class="profile-key">趣味</span>
                                <span class="profile-val">美味しいものを食べること<span class="unit">（封印中）</span></span>
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header">About</div>
                        <div class="card-body">
                            <p class="bio">中等部ナンバーワンアイドルだった元エリート。一見クールでストイックな皮肉屋だが、実際には甘えん坊で怠け者なトラブルメーカーという二面性を持つ少女。嫌いな自分から決別し、自分自身を好きになるため、トップアイドルを目指している。</p>
                        </div>
                    </div>

                </div>
            </main>

        </body>
        </html>
        """)
    }
}
