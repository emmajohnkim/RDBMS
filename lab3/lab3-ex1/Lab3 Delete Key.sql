ALTER TABLE IssueDetail
DROP FOREIGN KEY BookCode;
ALTER TABLE IssueDetail
DROP FOREIGN KEY MemberCode;
ALTER TABLE Book
DROP CONSTRAINT BookCode;
ALTER TABLE Member
DROP CONSTRAINT MemberCode;