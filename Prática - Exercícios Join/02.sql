SELECT * FROM testimonials;
writerId
recipientId
SELECT testimonials.id, c.name  AS writer, d.name AS recipient, testimonials.message FROM testimonials JOIN users c ON testimonials."writerId" = c.id JOIN users d ON  d.id = testimonials."recipientId" ;