---
title: Resume
date: 2020-01-09 08:37:06
tags:
  - Resume
  - JSON
  - DevOps
  - AWS
---
A few weeks ago I decided to use some of my free time over the holidays to refresh my resume with the goals of the past year. While editing my google doc and dealing with the arduous formatting, pagination issues and etc I came up with a question:
> Is there a schema for resume and can it be described using a JSON or YAML?

Enter [JSON Resume](https://jsonresume.org/), I knew I couldn't have been the only person to have posed this question.  The [JSON resume](https://jsonresume.org/) project seems well maintained and is still under active development. My reasoning for wanting a schema for my resume is best explained through several goals:

- Demonstrating proficency with object notation & key attribute languages like `json` or `YAML`
- A single source of truth for my resume that has several output mediums: web, pdf, physical paper
- Easily updated with further career growth
- Perfect usecase for building a CI/CD workflow using the AWS cloud suite:
  - [__AWS:CodeBuild__](https://aws.amazon.com/codebuild/)
  - [__AWS:CodePipeline__](https://aws.amazon.com/codepipeline/)
  - [__AWS:S3__](https://aws.amazon.com/s3/)
  - [__AWS:CloudFront__](https://aws.amazon.com/cloudfront/)
  - [__AWS:CertificateManager__](https://aws.amazon.com/certificate-manager/)
- Additional Exposure of resume through a public [Githib](https://github.com/nicholasvmoore/resume-moorenix-com) repository
- A usecase for my [nmoore.me](http://www.nmoore.me) domain
- SSL Encrypted
- The website has to be static & cheap

## Current Open Issues

- PDF exports do not render as well as using the PDF export feature of your browser: [Issue 94](https://github.com/jsonresume/resume-cli/issues/94)
- Date handling its extremely specific: [Issue 198](https://github.com/jsonresume/resume-schema/issues/198)

## Final Thoughts

Overall I'm satisfied with the outcome of the project. I'm able to make updates to my resume in a lanaguage that I am comfortable with. The website costs a fraction of a doller per month to host and build times are minimal. I believe anyone who is considereing learning DevOps or wants to expand their knowledge of CI/CD concepts through practical experience would find this exercise very useful & rewarding.
