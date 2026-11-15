import httpx
from mcp.server.fastmcp import FastMCP

# 初始化 Ollama 本機 MCP Server
mcp = FastMCP("ollama-local")

OLLAMA_API_URL = "http://localhost:11434/v1/chat/completions"

@mcp.tool()
def ask_qwen_coder(prompt: str, system_prompt: str = "你是一位精通 PostgreSQL、SQL 優化與 Python 的專家工程師，請以專業、精準且簡明的方式回答。") -> str:
    """
    調用本機 Ollama 的 qwen3-coder:30b 頂級程式碼模型。
    可用於：撰寫複雜 SQL、查詢效能優化 (Explain Plan)、程式碼審查、演算法設計等。
    """
    payload = {
        "model": "qwen3-coder:30b",
        "messages": [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": prompt}
        ],
        "temperature": 0.2
    }
    try:
        with httpx.Client(timeout=180.0) as client:
            resp = client.post(OLLAMA_API_URL, json=payload)
            resp.raise_for_status()
            data = resp.json()
            return data["choices"][0]["message"]["content"]
    except Exception as e:
        return f"調用本機 qwen3-coder:30b 失敗: {str(e)}"

@mcp.tool()
def ask_local_model(model_name: str, prompt: str, system_prompt: str = "你是一位專業的 AI 助理。") -> str:
    """
    調用本機 Ollama 上的任意已下載模型 (如 qwen3.8:27b, qwen3:8b, gemma3 等)。
    """
    payload = {
        "model": model_name,
        "messages": [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": prompt}
        ],
        "temperature": 0.3
    }
    try:
        with httpx.Client(timeout=180.0) as client:
            resp = client.post(OLLAMA_API_URL, json=payload)
            resp.raise_for_status()
            data = resp.json()
            return data["choices"][0]["message"]["content"]
    except Exception as e:
        return f"調用本機模型 {model_name} 失敗: {str(e)}"

if __name__ == "__main__":
    mcp.run(transport="stdio")
