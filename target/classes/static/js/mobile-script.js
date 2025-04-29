/**
 * 移动端小程序风格UI脚本
 */
$(document).ready(function() {
    // 检测是否为移动设备
    var isMobile = window.innerWidth <= 768;
    if (!isMobile) return;

    var currentPath = window.location.pathname;
    var isHomePage = currentPath === '/' || currentPath === '/index' || currentPath === '/mobile';
    var isTaskList = currentPath.includes('/task/list');
    var isTaskPage = currentPath.includes('/task/page');
    var isLoggedIn = !!($('.user-avatar').length > 0);
    var activeTab = 'home';

    if (isTaskList || isTaskPage) {
        activeTab = 'tasks';
    } else if (currentPath.includes('/message')) {
        activeTab = 'messages';
    } else if (currentPath.includes('/employee/dashboard') || currentPath.includes('/employer/dashboard')) {
        activeTab = 'profile';
    }

    // 创建顶部导航栏
    createNavbar();

    // 创建底部TabBar
    createTabbar(activeTab);

    // 首页特定元素
    if (isHomePage) {
        createHomePageElements();
    }

    // 任务列表页特定元素
    if (isTaskList) {
        // 添加搜索栏
        createSearchBar();
    }

    // 任务详情页特定元素
    if (isTaskPage) {
        // 任务详情页适配
        $('.single-page-header').addClass('mp-card').css({
            'margin': '60px 12px 10px 12px',
            'border-radius': '8px'
        });
    }

    // 初始化计数器
    if ($('.counter').length) {
        $('.counter').counterUp({
            delay: 10,
            time: 1000
        });
    }

    /**
     * 创建顶部导航栏
     */
    function createNavbar() {
        var pageTitle = '招聘平台';

        if (isTaskList) {
            pageTitle = '任务列表';
        } else if (isTaskPage) {
            pageTitle = '任务详情';
        } else if (currentPath.includes('/message')) {
            pageTitle = '消息';
        } else if (currentPath.includes('/dashboard')) {
            pageTitle = '个人中心';
        }

        var navbar = $('<div class="mp-navbar"><div class="mp-navbar-title">' + pageTitle + '</div></div>');

        // 如果已登录显示用户头像
        if (isLoggedIn) {
            var userImg = $('.user-avatar img').attr('src');
            var userAvatar = $('<div class="mp-navbar-user"><img src="' + userImg + '" alt="用户头像"></div>');
            navbar.append(userAvatar);
        } else {
            // 未登录显示登录按钮
            var loginBtn = $('<div class="mp-navbar-btns"><a href="/login">登录</a></div>');
            navbar.append(loginBtn);
        }

        $('body').prepend(navbar);
    }

    /**
     * 创建底部TabBar
     */
    function createTabbar(activeTab) {
        var tabbar = $('<div class="mp-tabbar"></div>');

        // 首页
        var homeTab = $('<a href="/index" class="mp-tab-item' + (activeTab === 'home' ? ' active' : '') + '"><i class="icon-feather-home mp-tab-icon"></i><span>首页</span></a>');

        // 任务
        var tasksTab = $('<a href="/task/list" class="mp-tab-item' + (activeTab === 'tasks' ? ' active' : '') + '"><i class="icon-material-outline-assignment mp-tab-icon"></i><span>任务</span></a>');

        // 消息
        var messagesTab = $('<a href="/message" class="mp-tab-item' + (activeTab === 'messages' ? ' active' : '') + '"><i class="icon-feather-message-circle mp-tab-icon"></i><span>消息</span></a>');

        // 我的
        var profileUrl = isLoggedIn ?
            ($('.user-name span:contains("自由职业者")').length ? '/employee/dashboard' : '/employer/dashboard') :
            '/login';

        var profileTab = $('<a href="' + profileUrl + '" class="mp-tab-item' + (activeTab === 'profile' ? ' active' : '') + '"><i class="icon-feather-user mp-tab-icon"></i><span>我的</span></a>');

        tabbar.append(homeTab).append(tasksTab).append(messagesTab).append(profileTab);
        $('body').append(tabbar);
    }

    /**
     * 创建首页元素
     */
    function createHomePageElements() {
        // 创建内容容器
        var content = $('<div class="mp-content"></div>');

        // 创建Banner
        var banner = $('<div class="mp-banner"><h2>随时随地聘请专家</h2><p>优秀的设计师，开发人员供您选择</p></div>');
        content.append(banner);

        // 未登录提示
        if (!isLoggedIn) {
            var loginCard = $(
                '<div class="mp-login-card">' +
                '<div class="text-area">' +
                '<span class="title">登录账号</span>' +
                '<p class="desc">登录后可发布任务或投标赚钱</p>' +
                '</div>' +
                '<div>' +
                '<a href="/login" class="mp-btn mp-btn-primary">登录</a>' +
                '<a href="/register" class="mp-btn mp-btn-secondary">注册</a>' +
                '</div>' +
                '</div>'
            );
            content.append(loginCard);
        }

        // 搜索栏
        createSearchBar(content);

        // 统计区域
        var taskCount = $('.counter:eq(0)').text();
        var employeeCount = $('.counter:eq(1)').text();
        var employerCount = $('.counter:eq(2)').text();

        var stats = $(
            '<div class="mp-stats">' +
            '<div class="mp-stat-item">' +
            '<div class="mp-stat-num counter">' + taskCount + '</div>' +
            '<div class="mp-stat-label">任务</div>' +
            '</div>' +
            '<div class="mp-stat-item">' +
            '<div class="mp-stat-num counter">' + employeeCount + '</div>' +
            '<div class="mp-stat-label">自由职业者</div>' +
            '</div>' +
            '<div class="mp-stat-item">' +
            '<div class="mp-stat-num counter">' + employerCount + '</div>' +
            '<div class="mp-stat-label">雇主</div>' +
            '</div>' +
            '</div>'
        );
        content.append(stats);

        // 添加热门分类
        var categoriesSection = $(
            '<div class="section">' +
            '<div class="mp-section-header">' +
            '<div class="mp-section-title">热门分类</div>' +
            '<a href="/task/list" class="mp-section-more">查看全部</a>' +
            '</div>' +
            '<div class="mp-card">' +
            '<div class="mp-categories"></div>' +
            '</div>' +
            '</div>'
        );

        // 获取现有分类，转换为小程序风格
        $('.photo-box').each(function(index) {
            if (index >= 8) return; // 最多显示8个分类

            var link = $(this).attr('href');
            var name = $(this).find('h3').text();

            var categoryItem = $(
                '<a href="' + link + '" class="mp-category-item">' +
                '<div class="mp-category-icon">' +
                '<i class="icon-line-awesome-code"></i>' +
                '</div>' +
                '<div class="mp-category-name">' + name + '</div>' +
                '</a>'
            );

            categoriesSection.find('.mp-categories').append(categoryItem);
        });

        content.append(categoriesSection);

        // 添加近期任务
        var tasksSection = $(
            '<div class="section">' +
            '<div class="mp-section-header">' +
            '<div class="mp-section-title">推荐任务</div>' +
            '<a href="/task/list" class="mp-section-more">查看全部</a>' +
            '</div>' +
            '<div class="mp-tasks"></div>' +
            '</div>'
        );

        // 获取现有任务，转换为小程序风格
        $('.task-listing').each(function() {
            var link = $(this).attr('href');
            var title = $(this).find('.task-listing-title').text();
            var desc = $(this).find('.task-icons li:eq(0)').text().trim();
            var time = $(this).find('.task-icons li:eq(1)').text().trim();
            var price = $(this).find('.task-offers strong').text();

            var taskItem = $(
                '<div class="mp-task-item">' +
                '<h3 class="mp-task-title">' + title + '</h3>' +
                '<div class="mp-task-info">' +
                '<div class="mp-task-meta">' +
                '<div class="mp-task-desc">' + desc + '</div>' +
                '<div class="mp-task-time"><i class="icon-material-outline-access-time"></i> ' + time + '</div>' +
                '</div>' +
                '<div class="mp-task-price">' + price + '</div>' +
                '</div>' +
                '<div class="mp-task-tags"></div>' +
                '<div class="mp-task-bottom">' +
                '<div class="mp-task-views"><i class="icon-feather-eye"></i> 浏览</div>' +
                '<a href="' + link + '" class="mp-task-btn">查看详情</a>' +
                '</div>' +
                '</div>'
            );

            // 添加技能标签
            $(this).find('.task-tags span').each(function(i) {
                if (i < 3) { // 最多显示3个标签
                    taskItem.find('.mp-task-tags').append('<span class="mp-task-tag">' + $(this).text() + '</span>');
                }
            });

            tasksSection.find('.mp-tasks').append(taskItem);
        });

        content.append(tasksSection);

        // 添加使用指南
        var guideSection = $(
            '<div class="mp-guide">' +
            '<div class="mp-guide-item">' +
            '<div class="mp-guide-icon">' +
            '<i class="icon-line-awesome-user-plus"></i>' +
            '</div>' +
            '<div class="mp-guide-text">注册</div>' +
            '</div>' +
            '<div class="mp-guide-item">' +
            '<div class="mp-guide-icon">' +
            '<i class="icon-line-awesome-search"></i>' +
            '</div>' +
            '<div class="mp-guide-text">找任务</div>' +
            '</div>' +
            '<div class="mp-guide-item">' +
            '<div class="mp-guide-icon">' +
            '<i class="icon-line-awesome-paper-plane"></i>' +
            '</div>' +
            '<div class="mp-guide-text">投标</div>' +
            '</div>' +
            '<div class="mp-guide-item">' +
            '<div class="mp-guide-icon">' +
            '<i class="icon-line-awesome-trophy"></i>' +
            '</div>' +
            '<div class="mp-guide-text">完成</div>' +
            '</div>' +
            '</div>'
        );

        content.append(guideSection);

        // 添加到body
        $('body').append(content);

        // 隐藏原有内容
        $('#wrapper').hide();
    }

    /**
     * 创建搜索栏
     */
    function createSearchBar(container) {
        var search = $(
            '<div class="mp-search">' +
            '<input id="key-mobile" type="text" class="mp-search-input" placeholder="搜索任务，例如：Java Web 网站">' +
            '<select id="category-mobile" class="mp-search-select">' +
            '<option value="0">分类</option>' +
            '</select>' +
            '</div>'
        );

        // 复制现有分类选项
        $('#category option').each(function() {
            var value = $(this).val();
            var text = $(this).text();
            search.find('#category-mobile').append('<option value="' + value + '">' + text + '</option>');
        });

        // 添加搜索事件
        search.find('.mp-search-input').keypress(function(e) {
            if (e.which == 13) {
                mobileSearch();
            }
        });

        search.find('.mp-search-select').change(function() {
            if ($("#key-mobile").val()) {
                mobileSearch();
            }
        });

        if (container) {
            container.append(search);
        } else {
            $('body').prepend(search);
        }
    }

    /**
     * 移动端搜索函数
     */
    function mobileSearch() {
        var categoryId = $("#category-mobile").val() || 0;
        var key = $("#key-mobile").val() || "";
        window.location.href = "/task/list?categoryId=" + categoryId + "&key=" + key;
    }
});