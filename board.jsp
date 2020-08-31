<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="new_board.BoardDTO, java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//
EN" "http://www/w3/org/TR/html4/loose.dtd">
<html lang="ja">
<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="keywords" content="">
		<title>掲示板サイト制作編</title>
		<link rel="stylesheet" href="./style.css">
</head>

<body>
	<div class="main-wraper">
		<div class="main-header">
			<h1 class="main-header__text">掲示板サイト</h1>
		</div>

		<div class="main-content">
			<div class="content-child">
				<h2 class="content-child__header">記事投稿</h2>

				<div><hr></div>
				<div class="child-insert">
				<!-- 記事登録用のフォーム -->
				<form name="insertForm" method="post" action="board">
						<div class="child-input__row">
								<div><textarea name="detail" placeholder="ここに投稿したい記事を書いてください。"></textarea></div>
								<div>
										<button type="submit" name="action" value="insert" class="child-table__btn btn--insert">登録</button>
								</div>
						</div>
				</form>
				</div>

				<h2 class="content-child__header">投稿一覧</h2>
				<div><hr></div>
				<div class="child-table">
					<!-- このタグを使用して、取得した投稿記事を一覧表示します。 開始 -->
					<!-- 記事削除用のフォーム  -->

					<%
					List<BoardDTO> topics = (List<BoardDTO>) request.getAttribute("topics");
					if (topics == null) {
					%>
					<p>登録されている記事がありません。</p>
					<%
					  }
					%>
							<!-- このタグを使用して、取得した投稿記事を一覧表示します。 終了 -->
					<%

					if (topics != null) {
						for (int i = topics.size() - 1; i >= 0; i--) {
							BoardDTO topic = topics.get(i);
					%>
					<form class="delete_form" name="deleteForm" method="post" action="board">
						<div class="child-table__row">
						<p><%=topic.getDetail() %></p>
						<p><%=topic.getStart_at() %></p>
					<p>
						<button type="submit" name="action" value="delete" class="child-table__btn btn--delete">削除</button>
					</p>
					</div>
					<!-- value属性にDBから取得した投稿記事IDを入れます。 -->
						<input type="hidden" name="board_id" value="<%=topic.getId() %>" />
					</form>
					<%
					  }
					}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>