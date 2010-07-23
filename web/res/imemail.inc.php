<?php
  //Incomedia WebSite X5 EMail Class. All rights reserved.

	//true = force the user email address to be set as the sender
  $imForceSender = false;
  
	class imEMail {
		var $from;
		var $to;
		var $subject;
		var $charset;
		var $text;
		var $html;
		
		var $attachments;
		
		function imEMail($from,$to,$subject,$charset) {
			$this->from = $from;
			$this->to = $to;
			$this->subject = $subject;
			$this->charset = $charset;
		}
		
		function setFrom($from) {
			$this->from = $from;
		}
		
		function setTo($to) {
			$this->to = $to;
		}
		
		function setSubject($subject) {
			$this->subject = $subject;
		}
		
		function setCharset($charset) {
			$this->charset = $charset;
		}
		
		function setText($text) {
			$this->text = $text;
		}
		
		function setHTML($html) {
			$this->html = $html;
		}
		
		function attachFile($name,$content,$mime_type) {
			$attachment['name'] = $name;
			$attachment['content'] = base64_encode($content);
			$attachment['mime_type'] = $mime_type;
			$this->attachments[] = $attachment;
		}
		
		function send() {
			$headers = "";
			$msg = "";

			if($this->from == "" || $this->to == "" || ($this->text == "" && $this->html == ""))
				return false;
			
			$boundary = md5(time());
			
			$headers .= "From: " . $this->from . "\r\n";
			$headers .= "Message-ID: <" . time() . rand(0,9) . rand(0,9) . "@websitex5.users>\r\n";
			$headers .= "X-Mailer: WebSiteX5 Mailer\r\n";
			$headers .= "MIME-Version: 1.0\r\n";

			if(is_array($this->attachments)) {
				$headers .= "Content-Type: multipart/mixed; boundary=\"" . $boundary . "\"\r\n\r\n";
				$headers .= "--" . $boundary . "\r\n";
			}
			
			if($this->html == "") {
				$headers .= "Content-Type: text/plain; charset=" . $this->charset . "\r\n";
				$headers .= "Content-Transfer-Encoding: 8bit\r\n";
				$msg .= $this->text . "\r\n\r\n";
			}
			else if($this->text == "") {
				$headers .= "Content-Type: text/html; charset=" . $this->charset . "\r\n";
				$headers .= "Content-Transfer-Encoding: 8bit\r\n";
				$msg .= $this->html . "\r\n\r\n";
			}
			else {
				$alt_boundary = $boundary . "_alt";
				$headers .= "Content-Type: multipart/alternative; boundary=\"" . $alt_boundary . "\"\r\n";
				
				$msg .= "--" . $alt_boundary . "\r\n";
				$msg .= "Content-Type: text/plain; charset=" . $this->charset . "\r\n";
				$msg .= "Content-Transfer-Encoding: 7bit\r\n\r\n";
				$msg .= $this->text . "\r\n\r\n";
				
				$msg .= "--" . $alt_boundary . "\r\n";
			  $msg .= "Content-Type: text/html; charset=" . $this->charset . "\r\n";
				$msg .= "Content-Transfer-Encoding: 7bit\r\n\r\n";
				$msg .= $this->html . "\r\n\r\n";
				
				$msg .= "--" . $alt_boundary . "--\r\n\r\n";
			}
			
			if(is_array($this->attachments)) {
				foreach($this->attachments as $attachment) {
					$msg .= "--" . $boundary . "\r\n";
					$msg .= "Content-Type: " . $attachment["mime_type"] . "; name=\"" . $attachment["name"] . "\"\r\n";
					$msg .= "Content-Transfer-Encoding: base64\r\n";
					$msg .= "Content-Disposition: attachment; filename=\"" . $attachment["name"] . "\"\r\n\r\n";
					$msg .= chunk_split($attachment["content"]) . "\r\n\r\n";
				}
			
				$msg .= "--" . $boundary . "--\r\n\r\n";
			}
			
			$r = @mail($this->to, $this->subject, $msg, $headers, "-f" . $this->from);
			if(!$r) {
				$headers = "To: " . $this->to . "\r\n" . $headers;
				$r = @mail($this->to, $this->subject, $msg, $headers);
			}
			return $r;
		}
	}
?>
