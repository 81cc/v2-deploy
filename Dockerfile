FROM alpine:3.23

# 更新系统并安装 Node.js，同时强制升级有漏洞的底层库
RUN apk update && \
    apk add --no-cache \
        nodejs \
        npm && \
    # 重点修复漏洞：升级 OpenSSL 和 zlib
    apk add --no-cache --upgrade \
        libcrypto3 \
        libssl3 \
        zlib && \
    rm -rf /var/cache/apk/*

ENV PORT=8080

# 复制你的应用
COPY app.js /root/

# 推荐：创建非 root 用户运行（安全更好）
RUN adduser -D -u 1000 appuser && \
    chown -R appuser /root

USER appuser

EXPOSE 8080

CMD ["node", "/root/app.js"]
