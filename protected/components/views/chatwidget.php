<div class="chat-window">
	<div class="switch" onclick="Chat.switchView()"></div>
	<div class="content">
		<div class="messages" align="left">
			<? foreach ($list as $item): ?>
				<div>- <?=$item->chatmessage_date?><?=$item->chatmessage_message?></div>
			<? endforeach; ?>
		</div>
		<input type="text" class="message-field" name="message" /><button type="submit">send</button>
	</div>
	<br clear="all" />
</div>
<script type="text/javascript">
	Chat.Init ();
</script>