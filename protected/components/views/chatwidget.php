<div class="chat-window">
	<div class="switch" onclick="Chat.switchView()"></div>
	<div class="content">
		<div class="messages" align="left">
			<? $this->renderMessageList (); ?>
		</div>
		<input type="text" class="message-field" name="message" />
		<button type="submit" onclick="Chat.Add(); return false">send</button>
	</div>
	<br clear="all" />
</div>
<script type="text/javascript">
	Chat.Init ();
	Chat.message_limit = <?=Chat::MaxMessageLength?>;
</script>